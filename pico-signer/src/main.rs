#![no_std]
#![no_main]

extern crate alloc;

mod allocator;
mod chunking;
mod handler;
mod protocol;
mod rng;
mod storage;
mod usb_hid;

use defmt::*;
use defmt_rtt as _;
use panic_probe as _;

use embassy_executor::Spawner;
use embassy_rp::bind_interrupts;
use embassy_rp::peripherals::USB;
use embassy_rp::usb::InterruptHandler;
use embassy_usb::class::hid::{HidReaderWriter, State as HidState};
use embassy_usb::Builder;

use embassy_rp::peripherals::TRNG;

bind_interrupts!(struct Irqs {
    USBCTRL_IRQ => InterruptHandler<USB>;
    TRNG_IRQ => embassy_rp::trng::InterruptHandler<TRNG>;
});

#[embassy_executor::main]
async fn main(_spawner: Spawner) {
    // 1. Initialize heap allocator
    allocator::init();

    // 2. Initialize RP2350 peripherals
    let p = embassy_rp::init(Default::default());

    // 3. Initialize TRNG-based RNG
    let pico_rng = rng::PicoRng::new(p.TRNG, Irqs);

    // 4. Initialize flash storage and try loading existing keys
    let mut key_storage = storage::KeyStorage::new(p.FLASH, p.DMA_CH0);
    let loaded_keys = key_storage.load();

    // 5. Initialize signer state
    let mut signer_state = handler::SignerState::new(pico_rng);
    if let Some((kp, pkp, dkg_secret)) = loaded_keys {
        info!("Restored key material from flash");
        signer_state.restore_keys(kp, pkp, dkg_secret);
    } else {
        info!("No key material in flash -- awaiting DKG");
    }

    // 6. Set up USB device
    let driver = embassy_rp::usb::Driver::new(p.USB, Irqs);

    let mut config = embassy_usb::Config::new(usb_hid::VID, usb_hid::PID);
    config.manufacturer = Some("MPCWallet");
    config.product = Some("Pico Signer");
    config.serial_number = Some("001");
    config.max_power = 100;
    config.max_packet_size_0 = 64;

    let mut config_descriptor = [0; 256];
    let mut bos_descriptor = [0; 256];
    let mut control_buf = [0; 64];
    let mut hid_state = HidState::new();

    let mut builder = Builder::new(
        driver,
        config,
        &mut config_descriptor,
        &mut bos_descriptor,
        &mut [], // msos descriptors
        &mut control_buf,
    );

    // 7. Create HID class with vendor-defined report descriptor
    let hid_config = embassy_usb::class::hid::Config {
        report_descriptor: usb_hid::REPORT_DESCRIPTOR,
        request_handler: None,
        poll_ms: 5,
        max_packet_size: 64,
    };
    let hid = HidReaderWriter::<_, 64, 64>::new(&mut builder, &mut hid_state, hid_config);

    // 8. Build USB device
    let mut usb = builder.build();

    // 9. Split HID into reader/writer and run everything
    let (reader, writer) = hid.split();

    let usb_fut = usb.run();
    let hid_fut = run_hid_loop(reader, writer, &mut signer_state, &mut key_storage);

    // Run USB stack and HID handler concurrently
    embassy_futures::join::join(usb_fut, hid_fut).await;
}

/// Main HID request-response loop.
async fn run_hid_loop<'d, D: embassy_usb::driver::Driver<'d>>(
    mut reader: embassy_usb::class::hid::HidReader<'d, D, 64>,
    mut writer: embassy_usb::class::hid::HidWriter<'d, D, 64>,
    state: &mut handler::SignerState,
    storage: &mut storage::KeyStorage,
) {
    let mut reassembler = chunking::Reassembler::new();
    let mut report_buf = [0u8; 64];

    info!("Pico Signer ready -- waiting for HID commands");

    loop {
        match reader.read(&mut report_buf).await {
            Ok(_) => {
                let report: &[u8; 64] = &report_buf;

                match reassembler.feed(report) {
                    Ok(Some(message)) => {
                        // Complete message received
                        let response_bytes = process_message(&message, state, storage);

                        // Chunk and send response
                        let reports = chunking::chunk_message(&response_bytes);
                        for report in &reports {
                            if let Err(e) = writer.write(report).await {
                                error!("HID write error: {:?}", e);
                                break;
                            }
                        }
                    }
                    Ok(None) => {
                        // More packets needed
                    }
                    Err(e) => {
                        warn!("Reassembly error: {}", e);
                        reassembler.reset();
                        // Send error response
                        let err_json = br#"{"error":"protocol framing error"}"#;
                        let reports = chunking::chunk_message(err_json);
                        for report in &reports {
                            let _ = writer.write(report).await;
                        }
                    }
                }
            }
            Err(e) => {
                error!("HID read error: {:?}", e);
                // USB disconnected -- wait and retry
                embassy_time::Timer::after_millis(100).await;
            }
        }
    }
}

/// Parse a JSON request, dispatch to handler, return JSON response bytes.
fn process_message(
    msg: &[u8],
    state: &mut handler::SignerState,
    storage: &mut storage::KeyStorage,
) -> alloc::vec::Vec<u8> {
    let json_str = match core::str::from_utf8(msg) {
        Ok(s) => s,
        Err(_) => return br#"{"error":"invalid UTF-8"}"#.to_vec(),
    };

    let response = match serde_json::from_str::<protocol::Request>(json_str) {
        Ok(req) => {
            let is_dkg_round3 = matches!(&req, protocol::Request::DkgRound3 { .. });
            let resp = state.handle(req);

            // Persist keys after successful DKG round 3
            if is_dkg_round3 {
                if let (Some(kp), Some(pkp)) = (state.key_package(), state.public_key_package()) {
                    if let Err(()) = storage.save(kp, pkp, state.dkg_secret()) {
                        warn!("Failed to persist key material to flash");
                    }
                }
            }

            resp
        }
        Err(e) => {
            warn!("Invalid request: {}", defmt::Debug2Format(&e));
            protocol::Response::Error {
                error: alloc::format!("invalid request: {}", e),
            }
        }
    };

    match serde_json::to_vec(&response) {
        Ok(bytes) => bytes,
        Err(_) => br#"{"error":"serialization failed"}"#.to_vec(),
    }
}

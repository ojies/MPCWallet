use rand_core::{CryptoRng, RngCore};

/// Hardware TRNG wrapper implementing `rand_core::RngCore + CryptoRng`.
///
/// Uses the RP2350's true random number generator peripheral.
pub struct PicoRng {
    inner: embassy_rp::trng::Trng<'static, embassy_rp::peripherals::TRNG>,
}

impl PicoRng {
    pub fn new(
        trng: embassy_rp::Peri<'static, embassy_rp::peripherals::TRNG>,
        irq: impl embassy_rp::interrupt::typelevel::Binding<
            embassy_rp::interrupt::typelevel::TRNG_IRQ,
            embassy_rp::trng::InterruptHandler<embassy_rp::peripherals::TRNG>,
        > + 'static,
    ) -> Self {
        Self {
            inner: embassy_rp::trng::Trng::new(trng, irq, embassy_rp::trng::Config::default()),
        }
    }
}

impl RngCore for PicoRng {
    fn next_u32(&mut self) -> u32 {
        let mut buf = [0u8; 4];
        self.fill_bytes(&mut buf);
        u32::from_le_bytes(buf)
    }

    fn next_u64(&mut self) -> u64 {
        let mut buf = [0u8; 8];
        self.fill_bytes(&mut buf);
        u64::from_le_bytes(buf)
    }

    fn fill_bytes(&mut self, dest: &mut [u8]) {
        self.inner.blocking_fill_bytes(dest);
    }

    fn try_fill_bytes(&mut self, dest: &mut [u8]) -> Result<(), rand_core::Error> {
        self.fill_bytes(dest);
        Ok(())
    }
}

impl CryptoRng for PicoRng {}

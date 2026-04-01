//! Non-Secure Callable (NSC) gateway functions.
//!
//! These are the only entry points from the Non-Secure world into Secure.
//! The NS world writes JSON request bytes into `NSC_IN_BUF`, calls
//! `nsc_process()`, and reads JSON response bytes from `NSC_OUT_BUF`.

extern crate alloc;

use core::sync::atomic::{AtomicBool, Ordering};
use defmt::*;
use threshold::keys::{KeyPackage, PublicKeyPackage};
use zeroize::Zeroize;

use crate::handler::SignerState;
use crate::rng::SecureRng;
use crate::storage;

const BUF_SIZE: usize = 4096;

static INITIALIZED: AtomicBool = AtomicBool::new(false);

// Shared buffers in Secure RAM.
// The NS world gets pointers to these via NSC calls.
static mut NSC_IN_BUF: [u8; BUF_SIZE] = [0u8; BUF_SIZE];
static mut NSC_OUT_BUF: [u8; BUF_SIZE] = [0u8; BUF_SIZE];

// SignerState and KeyStorage live in Secure static memory.
static mut SIGNER_STATE: Option<SignerState> = None;
static mut KEY_STORAGE: Option<storage::KeyStorage> = None;

/// Initialize signer state from loaded key material.
/// Called by Secure main.rs after allocator + TRNG are already initialized.
pub fn init_signer_state(
    keys: Option<(threshold::keys::KeyPackage, threshold::keys::PublicKeyPackage, Option<[u8; 32]>)>,
) {
    unsafe {
        let mut state = SignerState::new(SecureRng);
        if let Some((kp, pkp, secret)) = keys {
            info!("Restored key material from Secure flash");
            state.restore_keys(kp, pkp, secret);
        } else {
            info!("No key material — awaiting DKG");
        }
        SIGNER_STATE = Some(state);
        KEY_STORAGE = Some(storage::KeyStorage::new());
        INITIALIZED.store(true, Ordering::SeqCst);
    }
}

/// NSC entry point: Initialize the Secure crypto library.
/// Can be called from NS world through SG veneer.
/// Returns 0 on success, negative on error.
#[no_mangle]
#[inline(never)]
pub extern "cmse-nonsecure-entry" fn nsc_init() -> i32 {
    if INITIALIZED.load(Ordering::SeqCst) {
        return 0; // Already initialized
    }

    crate::allocator::init();
    crate::rng::init_trng();
    let keys = storage::load();

    unsafe {
        let mut state = SignerState::new(SecureRng);
        if let Some((kp, pkp, secret)) = keys {
            state.restore_keys(kp, pkp, secret);
        }
        SIGNER_STATE = Some(state);
        KEY_STORAGE = Some(storage::KeyStorage::new());
        INITIALIZED.store(true, Ordering::SeqCst);
    }

    0
}

/// Main NSC entry point.
///
/// NS world writes JSON request bytes into `NSC_IN_BUF[..in_len]`,
/// calls this function, then reads response bytes from `NSC_OUT_BUF`.
///
/// Returns the response length (>0) on success, or a negative error code.
#[no_mangle]
#[inline(never)]
pub extern "cmse-nonsecure-entry" fn nsc_process(in_len: u32) -> i32 {
    if !INITIALIZED.load(Ordering::SeqCst) {
        return -1;
    }
    let in_len = in_len as usize;
    if in_len > BUF_SIZE {
        return -2;
    }

    unsafe {
        let request_bytes = &NSC_IN_BUF[..in_len];

        let state = SIGNER_STATE.as_mut().unwrap();
        let key_storage = KEY_STORAGE.as_mut().unwrap();

        let response_bytes = process_message(request_bytes, state, key_storage);
        let resp_len = response_bytes.len().min(BUF_SIZE);
        NSC_OUT_BUF[..resp_len].copy_from_slice(&response_bytes[..resp_len]);

        // Zero input buffer (may contain DKG secrets during key generation)
        NSC_IN_BUF[..in_len].zeroize();

        resp_len as i32
    }
}

/// Get pointer to the input buffer (NS world writes request bytes here).
#[no_mangle]
#[inline(never)]
pub extern "cmse-nonsecure-entry" fn nsc_get_in_buf_ptr() -> *mut u8 {
    unsafe { NSC_IN_BUF.as_mut_ptr() }
}

/// Get pointer to the output buffer (NS world reads response bytes here).
#[no_mangle]
#[inline(never)]
pub extern "cmse-nonsecure-entry" fn nsc_get_out_buf_ptr() -> *const u8 {
    unsafe { NSC_OUT_BUF.as_ptr() }
}

/// Parse JSON request, dispatch to handler, persist keys if needed, return JSON response.
fn process_message(
    msg: &[u8],
    state: &mut SignerState,
    key_storage: &mut storage::KeyStorage,
) -> alloc::vec::Vec<u8> {
    use crate::protocol::{Request, Response};

    let json_str = match core::str::from_utf8(msg) {
        Ok(s) => s,
        Err(_) => return br#"{"error":"invalid UTF-8"}"#.to_vec(),
    };

    let response = match serde_json::from_str::<Request>(json_str) {
        Ok(req) => {
            let is_dkg_round3 = matches!(&req, Request::DkgRound3 { .. });
            let resp = state.handle(req);

            // Persist keys after successful DKG round 3
            if is_dkg_round3 {
                if let (Some(kp), Some(pkp)) = (state.key_package(), state.public_key_package()) {
                    if let Err(()) = key_storage.save(kp, pkp, state.dkg_secret()) {
                        warn!("Failed to persist key material to Secure flash");
                    }
                }
            }

            resp
        }
        Err(e) => {
            warn!("Invalid request: {}", defmt::Debug2Format(&e));
            Response::Error {
                error: alloc::format!("invalid request: {}", e),
            }
        }
    };

    match serde_json::to_vec(&response) {
        Ok(bytes) => bytes,
        Err(_) => br#"{"error":"serialization failed"}"#.to_vec(),
    }
}

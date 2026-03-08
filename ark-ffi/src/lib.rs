//! C-ABI FFI bindings for the Ark protocol library.
//!
//! All functions return a heap-allocated [`FfiResult`] that must be freed
//! with [`ark_free_result`].

use std::ffi::{CStr, CString};
use std::os::raw::c_char;
use std::ptr;

use ark::taptree::TapLeaf;

// ---------------------------------------------------------------------------
// FfiResult
// ---------------------------------------------------------------------------

/// Result struct returned by every ark FFI function.
///
/// - `success`: true if the operation succeeded.
/// - `data`: JSON or hex string on success (null on failure).
/// - `error`: error message on failure (null on success).
#[repr(C)]
pub struct FfiResult {
    pub success: bool,
    pub data: *mut c_char,
    pub error: *mut c_char,
}

impl FfiResult {
    fn ok(data: &str) -> *mut Self {
        let c_data = CString::new(data).unwrap_or_default();
        Box::into_raw(Box::new(FfiResult {
            success: true,
            data: c_data.into_raw(),
            error: ptr::null_mut(),
        }))
    }

    fn err(msg: &str) -> *mut Self {
        let c_error = CString::new(msg).unwrap_or_default();
        Box::into_raw(Box::new(FfiResult {
            success: false,
            data: ptr::null_mut(),
            error: c_error.into_raw(),
        }))
    }
}

// ---------------------------------------------------------------------------
// Memory management
// ---------------------------------------------------------------------------

/// Free an FfiResult returned by any ark_* function.
#[no_mangle]
pub extern "C" fn ark_free_result(ptr: *mut FfiResult) {
    if ptr.is_null() {
        return;
    }
    unsafe {
        let result = Box::from_raw(ptr);
        if !result.data.is_null() {
            drop(CString::from_raw(result.data));
        }
        if !result.error.is_null() {
            drop(CString::from_raw(result.error));
        }
    }
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

/// Read a C string pointer as a &str. Returns None if null or invalid UTF-8.
fn read_cstr(ptr: *const c_char) -> Option<String> {
    if ptr.is_null() {
        return None;
    }
    unsafe { CStr::from_ptr(ptr).to_str().ok().map(|s| s.to_string()) }
}

/// Helper: decode hex string to bytes.
fn hex_decode(s: &str) -> Result<Vec<u8>, String> {
    if s.len() % 2 != 0 {
        return Err("odd-length hex string".into());
    }
    let mut out = Vec::with_capacity(s.len() / 2);
    for i in (0..s.len()).step_by(2) {
        let byte = u8::from_str_radix(&s[i..i + 2], 16)
            .map_err(|_| format!("invalid hex at offset {i}"))?;
        out.push(byte);
    }
    Ok(out)
}

/// Helper: decode hex to 32-byte array.
fn hex_to_32(s: &str) -> Result<[u8; 32], String> {
    let bytes = hex_decode(s)?;
    if bytes.len() != 32 {
        return Err(format!("expected 32 bytes, got {}", bytes.len()));
    }
    let mut out = [0u8; 32];
    out.copy_from_slice(&bytes);
    Ok(out)
}

/// Helper: encode bytes as hex string.
fn hex_encode(bytes: &[u8]) -> String {
    bytes.iter().map(|b| format!("{:02x}", b)).collect()
}

// ---------------------------------------------------------------------------
// Ark protocol FFI functions
// ---------------------------------------------------------------------------

/// Compute the default VTXO script pubkey for the given keys and exit delay.
///
/// Returns hex-encoded 34-byte script pubkey (OP_1 <x-only tweaked key>).
#[no_mangle]
pub extern "C" fn ark_default_vtxo_script_pubkey(
    server_pk_hex: *const c_char,
    owner_pk_hex: *const c_char,
    exit_delay: u32,
) -> *mut FfiResult {
    let result = (|| -> Result<String, String> {
        let server_hex = read_cstr(server_pk_hex).ok_or("null server_pk_hex")?;
        let owner_hex = read_cstr(owner_pk_hex).ok_or("null owner_pk_hex")?;
        let server_pk = hex_to_32(&server_hex)?;
        let owner_pk = hex_to_32(&owner_hex)?;

        let tree = ark::default_vtxo_tree(&server_pk, &owner_pk, exit_delay);
        let spk = ark::vtxo_script_pubkey(&tree)
            .map_err(|e| format!("vtxo_script_pubkey: {e}"))?;
        Ok(hex_encode(&spk))
    })();

    match result {
        Ok(data) => FfiResult::ok(&data),
        Err(e) => FfiResult::err(&e),
    }
}

/// Get forfeit (cooperative) spend info for a default Ark VTXO.
///
/// Returns JSON: `{"script_hex": "...", "control_block_hex": "..."}`
#[no_mangle]
pub extern "C" fn ark_forfeit_spend_info(
    server_pk_hex: *const c_char,
    owner_pk_hex: *const c_char,
    exit_delay: u32,
) -> *mut FfiResult {
    let result = (|| -> Result<String, String> {
        let server_hex = read_cstr(server_pk_hex).ok_or("null server_pk_hex")?;
        let owner_hex = read_cstr(owner_pk_hex).ok_or("null owner_pk_hex")?;
        let server_pk = hex_to_32(&server_hex)?;
        let owner_pk = hex_to_32(&owner_hex)?;

        let (script, cb) = ark::forfeit_spend_info(&server_pk, &owner_pk, exit_delay)
            .ok_or("forfeit_spend_info failed")?;
        let json = format!(
            r#"{{"script_hex":"{}","control_block_hex":"{}"}}"#,
            hex_encode(&script),
            hex_encode(&cb.serialize()),
        );
        Ok(json)
    })();

    match result {
        Ok(data) => FfiResult::ok(&data),
        Err(e) => FfiResult::err(&e),
    }
}

/// Get exit (unilateral) spend info for a default Ark VTXO.
///
/// Returns JSON: `{"script_hex": "...", "control_block_hex": "..."}`
#[no_mangle]
pub extern "C" fn ark_exit_spend_info(
    server_pk_hex: *const c_char,
    owner_pk_hex: *const c_char,
    exit_delay: u32,
) -> *mut FfiResult {
    let result = (|| -> Result<String, String> {
        let server_hex = read_cstr(server_pk_hex).ok_or("null server_pk_hex")?;
        let owner_hex = read_cstr(owner_pk_hex).ok_or("null owner_pk_hex")?;
        let server_pk = hex_to_32(&server_hex)?;
        let owner_pk = hex_to_32(&owner_hex)?;

        let (script, cb) = ark::exit_spend_info(&server_pk, &owner_pk, exit_delay)
            .ok_or("exit_spend_info failed")?;
        let json = format!(
            r#"{{"script_hex":"{}","control_block_hex":"{}"}}"#,
            hex_encode(&script),
            hex_encode(&cb.serialize()),
        );
        Ok(json)
    })();

    match result {
        Ok(data) => FfiResult::ok(&data),
        Err(e) => FfiResult::err(&e),
    }
}

/// Build a forfeit/cooperative multisig script.
///
/// Returns hex-encoded script bytes.
#[no_mangle]
pub extern "C" fn ark_multisig_script(
    server_pk_hex: *const c_char,
    owner_pk_hex: *const c_char,
) -> *mut FfiResult {
    let result = (|| -> Result<String, String> {
        let server_hex = read_cstr(server_pk_hex).ok_or("null server_pk_hex")?;
        let owner_hex = read_cstr(owner_pk_hex).ok_or("null owner_pk_hex")?;
        let server_pk = hex_to_32(&server_hex)?;
        let owner_pk = hex_to_32(&owner_hex)?;

        let script = ark::multisig_script(&server_pk, &owner_pk);
        Ok(hex_encode(&script))
    })();

    match result {
        Ok(data) => FfiResult::ok(&data),
        Err(e) => FfiResult::err(&e),
    }
}

/// Build a CSV + signature exit script.
///
/// Returns hex-encoded script bytes.
#[no_mangle]
pub extern "C" fn ark_csv_sig_script(
    exit_delay: u32,
    owner_pk_hex: *const c_char,
) -> *mut FfiResult {
    let result = (|| -> Result<String, String> {
        let owner_hex = read_cstr(owner_pk_hex).ok_or("null owner_pk_hex")?;
        let owner_pk = hex_to_32(&owner_hex)?;

        let script = ark::csv_sig_script(exit_delay, &owner_pk);
        Ok(hex_encode(&script))
    })();

    match result {
        Ok(data) => FfiResult::ok(&data),
        Err(e) => FfiResult::err(&e),
    }
}

/// Compute the TapLeaf hash of a script (using default tapscript leaf version 0xc0).
///
/// Returns hex-encoded 32-byte leaf hash.
#[no_mangle]
pub extern "C" fn ark_tapleaf_hash(
    script_hex: *const c_char,
) -> *mut FfiResult {
    let result = (|| -> Result<String, String> {
        let hex_str = read_cstr(script_hex).ok_or("null script_hex")?;
        let script_bytes = hex_decode(&hex_str)?;

        let leaf = TapLeaf::new(script_bytes);
        Ok(hex_encode(&leaf.hash()))
    })();

    match result {
        Ok(data) => FfiResult::ok(&data),
        Err(e) => FfiResult::err(&e),
    }
}

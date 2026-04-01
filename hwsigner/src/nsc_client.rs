//! Non-Secure world client for calling into the Secure world via NSC veneers.
//!
//! The Secure world exposes three NSC functions:
//!   - nsc_get_in_buf_ptr()  -> pointer to shared input buffer
//!   - nsc_get_out_buf_ptr() -> pointer to shared output buffer
//!   - nsc_process(in_len)   -> process request, return response length

extern "C" {
    fn nsc_init() -> i32;
    fn nsc_get_in_buf_ptr() -> *mut u8;
    fn nsc_get_out_buf_ptr() -> *const u8;
    fn nsc_process(in_len: u32) -> i32;
}

/// Initialize the Secure crypto library.
/// Must be called once before any other NSC calls, while still in Secure state.
pub fn init() -> Result<(), i32> {
    let result = unsafe { nsc_init() };
    if result < 0 { Err(result) } else { Ok(()) }
}

/// Send a JSON request to the Secure world, get JSON response back.
///
/// Copies `request_json` into the shared input buffer, calls `nsc_process()`,
/// and returns a slice of the shared output buffer containing the response.
pub fn call_secure(request_json: &[u8]) -> Result<&'static [u8], i32> {
    unsafe {
        let in_ptr = nsc_get_in_buf_ptr();
        core::ptr::copy_nonoverlapping(request_json.as_ptr(), in_ptr, request_json.len());

        let result = nsc_process(request_json.len() as u32);
        if result < 0 {
            return Err(result);
        }

        let out_ptr = nsc_get_out_buf_ptr();
        Ok(core::slice::from_raw_parts(out_ptr, result as usize))
    }
}

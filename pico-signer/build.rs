use std::fs::File;
use std::io::Write;
use std::path::PathBuf;

fn main() {
    // Copy rp2350.x as memory.x into OUT_DIR so cortex-m-rt's link.x can find it
    let out = PathBuf::from(std::env::var_os("OUT_DIR").unwrap());
    println!("cargo:rustc-link-search={}", out.display());

    let memory_x = include_bytes!("rp2350.x");
    let mut f = File::create(out.join("memory.x")).unwrap();
    f.write_all(memory_x).unwrap();

    println!("cargo:rerun-if-changed=rp2350.x");
    println!("cargo:rerun-if-changed=build.rs");
}

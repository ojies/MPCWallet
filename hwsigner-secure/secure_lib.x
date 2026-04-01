/*
 * Secure Crypto Library linker script for RP2350 TrustZone firmware.
 *
 * This is a FLAT LIBRARY — no vector table, no Reset handler, no cortex-m-rt.
 * The main Embassy firmware initializes .bss/.data and calls NSC entry points
 * through SG veneers placed at the start of FLASH.
 *
 * Memory layout:
 *   0x10020000  SG veneers (NSC region, SAU-marked NSC)
 *   0x10020100+ Secure code (.text, .rodata)
 *   0x20060000  Secure RAM (.data, .bss, heap)
 *   0x103FF000  Key storage (SAU-marked Secure, accessed by storage.rs)
 */

/* Entry point — not actually called, but the linker requires one */
ENTRY(_secure_lib_dummy_entry);

/* Force linker to keep NSC entry points even under LTO */
EXTERN(nsc_process);
EXTERN(nsc_init);
EXTERN(nsc_get_in_buf_ptr);
EXTERN(nsc_get_out_buf_ptr);

MEMORY {
    FLASH : ORIGIN = 0x10020000, LENGTH = 256K
    RAM   : ORIGIN = 0x20060000, LENGTH = 128K
}

SECTIONS {
    /* SG veneers at the very start — known fixed address for SAU NSC region */
    .gnu.sgstubs ORIGIN(FLASH) : ALIGN(32) {
        __sgstubs_start = .;
        KEEP(*(.gnu.sgstubs));
        . = ALIGN(32);
        __sgstubs_end = .;
    } > FLASH

    .text : ALIGN(4) {
        *(.text .text.*)
    } > FLASH

    .rodata : ALIGN(4) {
        *(.rodata .rodata.*)
    } > FLASH

    /* Initialized data — stored in FLASH, copied to RAM by main firmware */
    .data : ALIGN(4) {
        __sdata = .;
        *(.data .data.*)
        . = ALIGN(4);
        __edata = .;
    } > RAM AT > FLASH
    __sidata = LOADADDR(.data);

    /* Zero-initialized data — zeroed by main firmware before first NSC call */
    .bss (NOLOAD) : ALIGN(4) {
        __sbss = .;
        *(.bss .bss.*)
        *(COMMON)
        . = ALIGN(4);
        __ebss = .;
    } > RAM

    /* Heap follows .bss — allocator uses the rest of RAM */
    __heap_start = __ebss;
    __heap_end = ORIGIN(RAM) + LENGTH(RAM);

    /DISCARD/ : {
        /* No vector table, no exception handlers, no startup code */
        *(.vector_table)
        *(.vector_table.*)
        *(.ARM.exidx .ARM.exidx.*)
    }
}

//! Flash persistence for key material.
//!
//! Stores KeyPackage, PublicKeyPackage, and (optionally) the original DKG
//! secret in the last 4KB flash sector so they survive power cycles.
//!
//! Layout v2:
//!   [magic:1=0xA5][version:1=0x02]
//!   [secret_len:2 BE][DKG secret bytes (32)]
//!   [kp_len:2 BE][KeyPackage JSON bytes]
//!   [pkp_len:2 BE][PublicKeyPackage JSON bytes]
//!   [crc32:4 BE] (over all preceding bytes)
//!
//! Layout v1 (backward-compatible read):
//!   [magic:1=0xA5][version:1=0x01]
//!   [kp_len:2 BE][KeyPackage JSON bytes]
//!   [pkp_len:2 BE][PublicKeyPackage JSON bytes]
//!   [crc32:4 BE] (over all preceding bytes)

extern crate alloc;

use defmt::*;
use embassy_rp::flash::{Async, Flash, ERASE_SIZE};
use threshold::keys::{KeyPackage, PublicKeyPackage};

const STORAGE_OFFSET: u32 = 0x3FF000; // Last 4KB sector
const SECTOR_SIZE: usize = ERASE_SIZE;
const MAGIC: u8 = 0xA5;
const VERSION: u8 = 0x02;
const VERSION_V1: u8 = 0x01;

pub struct KeyStorage {
    flash: Flash<'static, embassy_rp::peripherals::FLASH, Async, { 4 * 1024 * 1024 }>,
}

impl KeyStorage {
    pub fn new(
        flash: embassy_rp::Peri<'static, embassy_rp::peripherals::FLASH>,
        dma: embassy_rp::Peri<'static, impl embassy_rp::dma::Channel>,
    ) -> Self {
        Self {
            flash: Flash::new(flash, dma),
        }
    }

    /// Load key material from flash. Returns None if no valid data found.
    /// The optional `[u8; 32]` is the DKG secret (present in v2, absent in v1).
    pub fn load(&mut self) -> Option<(KeyPackage, PublicKeyPackage, Option<[u8; 32]>)> {
        let mut buf = [0u8; SECTOR_SIZE];
        if self.flash.blocking_read(STORAGE_OFFSET, &mut buf).is_err() {
            warn!("Flash read failed");
            return None;
        }

        if buf[0] != MAGIC {
            info!("No key material in flash (magic mismatch)");
            return None;
        }

        match buf[1] {
            VERSION => self.load_v2(&buf),
            VERSION_V1 => self.load_v1(&buf),
            _ => {
                info!("No key material in flash (version mismatch)");
                None
            }
        }
    }

    fn load_v1(&self, buf: &[u8; SECTOR_SIZE]) -> Option<(KeyPackage, PublicKeyPackage, Option<[u8; 32]>)> {
        // Parse KeyPackage
        let kp_len = u16::from_be_bytes([buf[2], buf[3]]) as usize;
        if 4 + kp_len + 2 > SECTOR_SIZE - 4 {
            warn!("Invalid kp_len in flash");
            return None;
        }
        let kp_json = core::str::from_utf8(&buf[4..4 + kp_len]).ok()?;

        // Parse PublicKeyPackage
        let pkp_offset = 4 + kp_len;
        let pkp_len = u16::from_be_bytes([buf[pkp_offset], buf[pkp_offset + 1]]) as usize;
        let pkp_start = pkp_offset + 2;
        if pkp_start + pkp_len > SECTOR_SIZE - 4 {
            warn!("Invalid pkp_len in flash");
            return None;
        }
        let pkp_json = core::str::from_utf8(&buf[pkp_start..pkp_start + pkp_len]).ok()?;

        // Verify CRC32
        let crc_offset = pkp_start + pkp_len;
        let stored_crc = u32::from_be_bytes([
            buf[crc_offset],
            buf[crc_offset + 1],
            buf[crc_offset + 2],
            buf[crc_offset + 3],
        ]);
        let computed_crc = crc32(&buf[..crc_offset]);
        if stored_crc != computed_crc {
            warn!("Flash CRC mismatch");
            return None;
        }

        let kp = KeyPackage::from_json(kp_json).ok()?;
        let pkp = PublicKeyPackage::from_json(pkp_json).ok()?;

        info!("Loaded key material from flash (v1, no DKG secret)");
        Some((kp, pkp, None))
    }

    fn load_v2(&self, buf: &[u8; SECTOR_SIZE]) -> Option<(KeyPackage, PublicKeyPackage, Option<[u8; 32]>)> {
        // Parse DKG secret
        let secret_len = u16::from_be_bytes([buf[2], buf[3]]) as usize;
        if secret_len != 32 {
            warn!("Invalid secret_len in flash: {}", secret_len);
            return None;
        }
        let mut dkg_secret = [0u8; 32];
        dkg_secret.copy_from_slice(&buf[4..36]);

        // Parse KeyPackage
        let kp_offset = 36;
        let kp_len = u16::from_be_bytes([buf[kp_offset], buf[kp_offset + 1]]) as usize;
        let kp_start = kp_offset + 2;
        if kp_start + kp_len + 2 > SECTOR_SIZE - 4 {
            warn!("Invalid kp_len in flash");
            return None;
        }
        let kp_json = core::str::from_utf8(&buf[kp_start..kp_start + kp_len]).ok()?;

        // Parse PublicKeyPackage
        let pkp_offset = kp_start + kp_len;
        let pkp_len = u16::from_be_bytes([buf[pkp_offset], buf[pkp_offset + 1]]) as usize;
        let pkp_start = pkp_offset + 2;
        if pkp_start + pkp_len > SECTOR_SIZE - 4 {
            warn!("Invalid pkp_len in flash");
            return None;
        }
        let pkp_json = core::str::from_utf8(&buf[pkp_start..pkp_start + pkp_len]).ok()?;

        // Verify CRC32
        let crc_offset = pkp_start + pkp_len;
        let stored_crc = u32::from_be_bytes([
            buf[crc_offset],
            buf[crc_offset + 1],
            buf[crc_offset + 2],
            buf[crc_offset + 3],
        ]);
        let computed_crc = crc32(&buf[..crc_offset]);
        if stored_crc != computed_crc {
            warn!("Flash CRC mismatch");
            return None;
        }

        let kp = KeyPackage::from_json(kp_json).ok()?;
        let pkp = PublicKeyPackage::from_json(pkp_json).ok()?;

        info!("Loaded key material from flash (v2, with DKG secret)");
        Some((kp, pkp, Some(dkg_secret)))
    }

    /// Save key material to flash. Erases the sector first.
    pub fn save(
        &mut self,
        kp: &KeyPackage,
        pkp: &PublicKeyPackage,
        dkg_secret: Option<&[u8; 32]>,
    ) -> Result<(), ()> {
        let kp_json = kp.to_json();
        let pkp_json = pkp.to_json();

        let kp_bytes = kp_json.as_bytes();
        let pkp_bytes = pkp_json.as_bytes();

        let secret_bytes: &[u8; 32] = match dkg_secret {
            Some(s) => s,
            None => {
                error!("DKG secret required for v2 save");
                return Err(());
            }
        };

        // Build buffer: header(2) + secret_len(2) + secret(32) + kp_len(2) + kp + pkp_len(2) + pkp + crc(4)
        let total = 2 + 2 + 32 + 2 + kp_bytes.len() + 2 + pkp_bytes.len() + 4;
        if total > SECTOR_SIZE {
            error!("Key material too large for flash sector");
            return Err(());
        }

        let mut buf = [0xFFu8; SECTOR_SIZE];
        buf[0] = MAGIC;
        buf[1] = VERSION;

        // DKG secret
        buf[2..4].copy_from_slice(&32u16.to_be_bytes());
        buf[4..36].copy_from_slice(secret_bytes);

        // KeyPackage
        let kp_offset = 36;
        buf[kp_offset..kp_offset + 2].copy_from_slice(&(kp_bytes.len() as u16).to_be_bytes());
        let kp_start = kp_offset + 2;
        buf[kp_start..kp_start + kp_bytes.len()].copy_from_slice(kp_bytes);

        // PublicKeyPackage
        let pkp_offset = kp_start + kp_bytes.len();
        buf[pkp_offset..pkp_offset + 2].copy_from_slice(&(pkp_bytes.len() as u16).to_be_bytes());
        let pkp_start = pkp_offset + 2;
        buf[pkp_start..pkp_start + pkp_bytes.len()].copy_from_slice(pkp_bytes);

        // CRC32
        let crc_offset = pkp_start + pkp_bytes.len();
        let crc = crc32(&buf[..crc_offset]);
        buf[crc_offset..crc_offset + 4].copy_from_slice(&crc.to_be_bytes());

        // Erase and write
        self.flash
            .blocking_erase(STORAGE_OFFSET, STORAGE_OFFSET + SECTOR_SIZE as u32)
            .map_err(|_| {
                error!("Flash erase failed");
            })?;

        self.flash
            .blocking_write(STORAGE_OFFSET, &buf)
            .map_err(|_| {
                error!("Flash write failed");
            })?;

        info!("Saved key material to flash");
        Ok(())
    }

    /// Erase key material from flash.
    pub fn erase(&mut self) -> Result<(), ()> {
        self.flash
            .blocking_erase(STORAGE_OFFSET, STORAGE_OFFSET + SECTOR_SIZE as u32)
            .map_err(|_| {
                error!("Flash erase failed");
            })
    }
}

/// Simple CRC32 (no lookup table to save flash space).
fn crc32(data: &[u8]) -> u32 {
    let mut crc: u32 = 0xFFFF_FFFF;
    for &byte in data {
        crc ^= byte as u32;
        for _ in 0..8 {
            if crc & 1 != 0 {
                crc = (crc >> 1) ^ 0xEDB8_8320;
            } else {
                crc >>= 1;
            }
        }
    }
    !crc
}

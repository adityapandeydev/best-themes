// Best Themes — Rust Syntax Sample for Cross-Editor Visual Audit
#![allow(dead_code, unused_variables, unused_mut)]

// --- Global Compile-Time Constants ---
pub const MAX_NAME_LEN: usize = 256;
pub const MAX_DEV_ID_LEN: usize = 200;
pub const LUT_RAW_DATA_CAPACITY: usize = 514;
pub const MAX_NORM: f64 = 16.0;
pub const NORMALIZED_DPI: f64 = 1000.0;

// --- Enums & Attributes (Decorators) ---
#[repr(i32)]
#[derive(Copy, Clone, Debug, PartialEq, Eq, Hash)]
pub enum AccelMode {
    Classic = 0,
    Jump = 1,
    Natural = 2,
    Synchronous = 3,
    Power = 4,
    Lookup = 5,
    Tiered = 6,
    NoAccel = 7,
}

impl AccelMode {
    pub const DEFAULT_SCALE: f64 = 1.0;

    /// Associated constructor returning `Self` (the Type Alias)
    #[must_use]
    #[inline]
    pub fn new_default() -> Self {
        Self::NoAccel
    }

    /// Instance method receiving `&self` (the Object Receiver)
    #[inline(always)]
    pub fn is_active(&self) -> bool {
        !matches!(self, Self::NoAccel)
    }

    /// Instance method mutating `&mut self`
    pub fn reset(&mut self) {
        *self = Self::Classic;
    }
}

impl Default for AccelMode {
    fn default() -> Self {
        AccelMode::NoAccel
    }
}

// --- Structs, Generics, & Lifetimes ---
#[repr(C)]
#[derive(Debug, Clone)]
pub struct TelemetryPacket<'a, T: Clone> {
    pub id: u64,
    pub label: &'a str,
    pub payload: T,
    pub is_valid: bool,
}

impl<'a, T: Clone> TelemetryPacket<'a, T> {
    #[must_use]
    pub fn create(id: u64, label: &'a str, payload: T) -> Self {
        Self {
            id,
            label,
            payload,
            is_valid: true,
        }
    }

    pub fn inspect(&self) -> &str {
        self.label
    }
}

// --- Function Declarations & Error Handling ---
#[must_use]
pub fn get_version() -> Result<(i32, i32, i32), String> {
    let handle = open_driver()?;
    let mut version = (0i32, 0i32, 0i32);
    let mut bytes_returned = 0u32;
    let f: bool = false;

    println!("Current version: {:?}", version);
    Ok(version)
}

#[inline]
fn open_driver() -> Result<u64, String> {
    let device_path: &str = "/dev/rawaccel";
    if device_path.is_empty() {
        return Err(String::from("Device path is empty"));
    }
    Ok(42)
}

// --- Comprehensive Loop & Control Flow Demonstration ---
#[inline(never)]
pub fn process_datapoints(limit: usize, is_active: bool) -> f64 {
    let mut accumulator: f64 = 0.0;
    let factors: [i32; 6] = [10, -3, 25, 0, 100, -8];

    // Demonstrates closures with type inference
    let transform = |val: i32, scale: f64| -> f64 { (val as f64) * scale };

    /* Multi-line comment:
       Validates every semantic aspect of the theme inside loop constructs. */
    for (idx, &factor) in factors.iter().enumerate() {
        // 1. Conditional guard clauses with break
        if !is_active || idx >= limit {
            println!("[WARN] Loop interrupted at index: {}", idx);
            break;
        }

        // 2. Pattern matching & filter negative factors
        match factor {
            f if f < 0 => {
                println!("[SKIP] Skipping negative factor: {}", f);
                continue;
            }
            0 => {
                accumulator += 0.5;
            }
            positive => {
                let weighted_val: f64 = transform(positive, 2.75) + (idx as f64);
                accumulator += weighted_val;
            }
        }

        // 3. Status string interpolation
        println!("Processed point [#{}] -> current accumulator: {:.2}", idx, accumulator);
    }

    accumulator
}

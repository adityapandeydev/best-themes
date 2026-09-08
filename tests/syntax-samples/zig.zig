// Best Themes — Zig Syntax Sample for Cross-Editor Visual Audit
const std = @import("std");

// --- Global Compile-Time Constants ---
pub const MAX_CAPACITY: usize = 512;
pub const DEFAULT_SCALE: f64 = 16.0;
pub const DRIVER_ENDPOINT: []const u8 = "/dev/rawaccel";

// --- Error Sets ---
pub const TelemetryError = error{
    BufferExhausted,
    DeviceOffline,
    InvalidChecksum,
    TimeoutOccurred,
};

// --- Enums & Tagged Unions ---
pub const DeviceState = enum(u8) {
    idle = 0,
    streaming = 1,
    calibrating = 2,
    disconnected = 3,

    pub fn isOnline(self: DeviceState) bool {
        return self != .disconnected;
    }
};

pub const SensorPayload = union(enum) {
    raw_integer: i32,
    calibrated_float: f64,
    status_message: []const u8,
};

// --- Structs with Methods & Comptime ---
pub const SensorPacket = struct {
    id: u32,
    raw_reading: i32,
    is_valid: bool,
    state: DeviceState,

    const Self = @This();

    pub fn init(id: u32, reading: i32) Self {
        return Self{
            .id = id,
            .raw_reading = reading,
            .is_valid = true,
            .state = .idle,
        };
    }

    pub fn formatTelemetry(self: *const Self) !f64 {
        if (!self.state.isOnline()) {
            @setCold(true);
            return TelemetryError.DeviceOffline;
        }
        return @floatFromInt(self.raw_reading);
    }
};

// --- Comprehensive For Loop Demonstration with Zig Built-ins ---
pub fn processSensorData(samples: []const i32, max_limit: usize, verbose: bool) TelemetryError!f64 {
    var accumulated_score: f64 = 0.0;

    // Multi-line comment:
    // Demonstrates Zig for loops with multiple captures, guard clauses, builtins, and error handling.
    for (samples, 0..) |sample, idx| {
        // 1. Guard conditions with break
        if (idx >= max_limit) {
            if (verbose) {
                std.debug.print("[HALT] Sample limit reached at index: {d}\n", .{idx});
            }
            break;
        }

        // 2. Control flow: skip negative readings
        if (sample < 0) {
            if (verbose) {
                std.debug.print("[SKIP] Negative reading at #{d}: {d}\n", .{ idx, sample });
            }
            continue;
        } else if (sample == 0) {
            accumulated_score += 0.1;
        } else {
            const casted: f64 = @floatFromInt(sample);
            const weighted: f64 = casted * 1.65 + @as(f64, @floatFromInt(idx)) * 0.1;
            accumulated_score += weighted;
        }

        // 3. Formatted debug printing
        if (verbose and (idx % 2 == 0)) {
            std.debug.print("Index [{d:0>2}]: sample={d}, score={d:.2}\n", .{ idx, sample, accumulated_score });
        }
    }

    return accumulated_score;
}

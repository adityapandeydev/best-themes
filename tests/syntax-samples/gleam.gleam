// Best Themes — Gleam Syntax Sample for Cross-Editor Visual Audit
import gleam/io
import gleam/int
import gleam/list
import gleam/float
import gleam/result

// --- Gleam Attributes / Annotations (Decorators) ---
@target(erlang)
pub const target_platform: String = "BEAM_OTP"

pub const max_capacity: Int = 512
pub const default_scale: Float = 16.0

// --- Custom Types (Enums & Tagged Unions) ---
pub type DeviceStatus {
  Active(channel: Int)
  Standby
  Disconnected
}

pub type MetricPacket {
  MetricPacket(id: Int, value: Int, is_valid: Bool)
}

// External Erlang function binding with attribute
@external(erlang, "erlang", "display")
pub fn debug_inspect(term: a) -> a

// Deprecated function attribute demonstration
@deprecated("Use process_batch_pipeline instead for performance")
pub fn legacy_accumulate(items: List(Int)) -> Float {
  process_batch_recursive(items, 0, 100, 0.0)
}

// In Gleam (purely functional), iteration loops are implemented 
// via tail-recursive functions or list transformations:
pub fn process_batch_recursive(
  items: List(Int),
  index: Int,
  max_limit: Int,
  accumulator: Float,
) -> Float {
  case items {
    // 1. Guard check: reached end of list or hit max_limit (break equivalent)
    _ if index >= max_limit -> {
      io.println("[LIMIT] Recursive loop halted at max limit")
      accumulator
    }
    [] -> accumulator

    // 2. Head-tail recursion with condition branching
    [head, ..tail] -> {
      case head {
        // Negative filter (continue equivalent: skip without modifying accumulator)
        val if val < 0 -> {
          io.println("[SKIP] Skipping negative value: " <> int.to_string(val))
          process_batch_recursive(tail, index + 1, max_limit, accumulator)
        }

        0 -> {
          process_batch_recursive(tail, index + 1, max_limit, accumulator +. 0.25)
        }

        val -> {
          let weighted = int.to_float(val) *. 1.75 +. int.to_float(index) *. 0.1
          let next_acc = accumulator +. weighted
          io.println("Index " <> int.to_string(index) <> " processed successfully")
          process_batch_recursive(tail, index + 1, max_limit, next_acc)
        }
      }
    }
  }
}

// Demonstration via List pipeline iteration with Result handling
pub fn process_batch_pipeline(samples: List(Int), limit: Int) -> Result(Float, String) {
  case samples {
    [] -> Error("Sample batch cannot be empty")
    _ -> {
      let total = 
        samples
        |> list.take(limit)
        |> list.filter(fn(x) { x >= 0 })
        |> list.fold(0.0, fn(acc, item) {
          acc +. int.to_float(item) *. 1.5
        })
      Ok(total)
    }
  }
}

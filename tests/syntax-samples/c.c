/* Best Themes — C Syntax Sample for Cross-Editor Visual Audit */
#include <stdio.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

// --- Macro Definitions & Preprocessor Directives ---
#define MAX_BUFFER_SIZE 512
#define DEFAULT_GAIN    2.5f
#define RAWACCEL_TAG    "RAWACCEL_C99"

#ifdef __GNUC__
#define FORCE_INLINE __attribute__((always_inline)) inline
#define DEPRECATED_FUNC(msg) __attribute__((deprecated(msg)))
#define PACKED_STRUCT __attribute__((packed))
#else
#define FORCE_INLINE inline
#define DEPRECATED_FUNC(msg)
#define PACKED_STRUCT
#endif

// --- Enums & Typedefs ---
typedef enum {
    STATUS_IDLE = 0,
    STATUS_RUNNING = 1,
    STATUS_STANDBY = 2,
    STATUS_ERROR = -1
} DeviceState;

// Struct with attribute decorator
typedef struct PACKED_STRUCT {
    uint32_t id;
    float sample_rate;
    bool is_calibrated;
    DeviceState state;
} DeviceProfile;

// Function pointer typedef
typedef double (*SignalFilter)(int raw_val, double gain);

// Helper function with attributes
static FORCE_INLINE double default_filter(int raw_val, double gain) {
    return ((double)raw_val) * gain;
}

DEPRECATED_FUNC("Use modern telemetry pipeline instead")
void legacy_calibration_dump(const DeviceProfile* profile) {
    if (profile != NULL) {
        printf("[LEGACY] Calibrated: %s\n", profile->is_calibrated ? "YES" : "NO");
    }
}

/* --- Comprehensive For Loop Demonstration with C99 Semantics --- */
double process_signal_samples(const int* samples, int sample_count, int max_limit, bool verbose) {
    double total_power = 0.0;
    const SignalFilter active_filter = &default_filter;

    /* Multi-line comment:
       Tests C control structures, compiler attributes (__attribute__),
       pointer arithmetic, typedefs, enums, and string formatting. */
    for (int idx = 0; idx < sample_count; ++idx) {
        const int raw_value = *(samples + idx);

        // 1. Guard conditions with break
        if (idx >= max_limit) {
            if (verbose) {
                printf("[HALT] Sample count limit reached at index: %d\n", idx);
            }
            break;
        }

        // 2. Conditional branches with continue
        if (raw_value < 0) {
            if (verbose) {
                printf("[SKIP] Skipping negative sample at index %d: %d\n", idx, raw_value);
            }
            continue;
        } else if (raw_value == 0) {
            total_power += 0.01;
        } else {
            double normalized = active_filter(raw_value, (double)DEFAULT_GAIN) + (idx * 0.05);
            total_power += normalized;
        }

        // 3. Status output
        if (verbose && (idx % 2 == 0)) {
            printf("Sample [%02d] = %d (Accumulated Power: %.3f)\n", idx, raw_value, total_power);
        }
    }

    return total_power;
}

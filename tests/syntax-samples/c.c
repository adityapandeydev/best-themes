/* Best Themes — C Syntax Sample for Cross-Editor Visual Audit */
#include <stdio.h>
#include <stdbool.h>

#define MAX_BUFFER_SIZE 512
#define DEFAULT_GAIN    2.5f

typedef enum {
    STATUS_IDLE = 0,
    STATUS_RUNNING = 1,
    STATUS_ERROR = -1
} DeviceState;

typedef struct {
    int id;
    float sample_rate;
    bool is_calibrated;
} DeviceProfile;

/* --- Comprehensive For Loop Demonstration --- */
double process_signal_samples(const int* samples, int sample_count, int max_limit, bool verbose) {
    double total_power = 0.0;

    /* Multi-line comment:
       Tests C control structures, pointer dereference, keywords, formatting. */
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
            double normalized = (double)raw_value * 1.33 + (idx * 0.05);
            total_power += normalized;
        }

        // 3. Status output
        if (verbose && (idx % 2 == 0)) {
            printf("Sample [%02d] = %d (Accumulated Power: %.3f)\n", idx, raw_value, total_power);
        }
    }

    return total_power;
}

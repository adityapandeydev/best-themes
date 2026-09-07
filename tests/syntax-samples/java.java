// Best Themes — Java Syntax Sample for Cross-Editor Visual Audit
package dev.bestthemes.samples;

import java.util.List;
import java.util.ArrayList;

public class MathTelemetry {
    // Constants & access modifiers
    public static final String DRIVER_TAG = "RAWACCEL_JNI";
    private static final double MAX_NORM = 16.0;
    protected int retryCount = 3;

    public enum DeviceStatus {
        ACTIVE,
        STANDBY,
        DISCONNECTED
    }

    public record DeviceInfo(String id, int port, boolean enabled) {}

    // --- Comprehensive For Loop Demonstration ---
    public static double processBatch(int[] dataPoints, int maxLimit, boolean debug) {
        double accumulatedTotal = 0.0;

        /* Multi-line comment:
           Tests Java control flow, primitive types, modifiers, and loop constructs. */
        for (int index = 0; index < dataPoints.length; index++) {
            final int currentVal = dataPoints[index];

            // 1. Guard check with break
            if (index >= maxLimit) {
                if (debug) {
                    System.out.println(String.format("[WARN] Batch limit reached at index %d", index));
                }
                break;
            }

            // 2. Control flow: continue & conditional branching
            if (currentVal < 0) {
                if (debug) {
                    System.out.println("[SKIP] Ignoring negative value: " + currentVal);
                }
                continue;
            } else if (currentVal == 0) {
                accumulatedTotal += 0.25;
            } else {
                double weight = (currentVal * 1.75) + (index * 0.1);
                accumulatedTotal += weight;
            }

            // 3. String formatting and boolean check
            if (debug && accumulatedTotal > 100.0) {
                System.out.printf("Index %d crossed threshold with sum: %.2f\n", index, accumulatedTotal);
            }
        }

        return accumulatedTotal;
    }
}

// Best Themes — Java Syntax Sample for Cross-Editor Visual Audit
package dev.bestthemes.samples;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.util.List;
import java.util.ArrayList;
import java.util.Objects;
import java.util.function.Function;

// --- Custom Annotation (Decorator) Definitions ---
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.TYPE, ElementType.METHOD})
@interface MetricTracker {
    String category() default "system";
    int timeoutMs() default 5000;
    boolean enabled() default true;
}

@FunctionalInterface
interface TelemetryProcessor<T, R> {
    R apply(T input, double scaleFactor);
}

// --- Decorated Class Implementation ---
@MetricTracker(category = "kernel_io", timeoutMs = 2500)
public class MathTelemetry implements AutoCloseable {
    // Constants & Access Modifiers
    public static final String DRIVER_TAG = "RAWACCEL_JNI";
    private static final double MAX_NORM = 16.0;
    protected static final int BUFFER_CAPACITY = 514;
    private final String endpoint;
    protected int retryCount = 3;

    // --- Enums with Values & Methods ---
    public enum DeviceStatus {
        ACTIVE(1, "Operational"),
        STANDBY(2, "Low Power"),
        DISCONNECTED(0, "Offline");

        private final int code;
        private final String description;

        DeviceStatus(int code, String description) {
            this.code = code;
            this.description = description;
        }

        public int getCode() {
            return this.code;
        }
    }

    public record DeviceInfo(String id, int port, boolean enabled) {}

    public MathTelemetry(String endpoint) {
        this.endpoint = Objects.requireNonNull(endpoint, "Endpoint cannot be null");
    }

    @Override
    @Deprecated
    public void close() {
        System.out.println("Closing MathTelemetry resource for " + this.endpoint);
    }

    // --- Annotated Processing Method with Comprehensive Loops ---
    @SuppressWarnings({"unused", "unchecked"})
    @MetricTracker(category = "batch_compute", timeoutMs = 1000)
    public static double processBatch(int[] dataPoints, int maxLimit, boolean debug) {
        double accumulatedTotal = 0.0;
        final TelemetryProcessor<Integer, Double> scaler = (val, factor) -> val * factor;

        /* Multi-line comment:
           Tests Java control flow, annotations, primitive types, modifiers, and loop constructs. */
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
                double weight = scaler.apply(currentVal, 1.75) + (index * 0.1);
                accumulatedTotal += weight;
            }

            // 3. String formatting and threshold check
            if (debug && accumulatedTotal > 100.0) {
                System.out.printf("Index %d crossed threshold with sum: %.2f\n", index, accumulatedTotal);
            }
        }

        return accumulatedTotal;
    }
}

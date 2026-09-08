// Best Themes — C# Syntax Sample for Cross-Editor Visual Audit
namespace BestThemes.Samples;

using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

// --- Custom Attribute (Decorator) Definition ---
[AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, Inherited = true, AllowMultiple = false)]
public sealed class TelemetryMetricAttribute : Attribute
{
    public string Category { get; }
    public int SampleRateHz { get; init; } = 1000;

    public TelemetryMetricAttribute(string category)
    {
        Category = category;
    }
}

// --- Interface with Documentation ---
public interface ITelemetryProcessor
{
    double ProcessBatch(int[] dataPoints, int maxLimit, bool debug);
}

// --- Decorated Record & Enums ---
[Flags]
public enum DeviceStatus : byte
{
    None = 0,
    Active = 1 << 0,
    Standby = 1 << 1,
    Calibrated = 1 << 2,
    Error = 1 << 3
}

public record DeviceInfo(
    [property: JsonPropertyName("device_id")] string Id,
    [property: JsonPropertyName("port_number")] int Port,
    [property: JsonPropertyName("is_enabled")] bool Enabled
);

// --- Decorated Class Implementation ---
[Serializable]
[TelemetryMetric("KernelDriverIO", SampleRateHz = 2500)]
public class MathTelemetry : ITelemetryProcessor
{
    // Constants & Access Modifiers
    public const string DriverTag = "RAWACCEL_DOTNET";
    private static readonly double MaxNorm = 16.0;
    protected const int BufferCapacity = 514;
    protected int retryCount = 3;

    [JsonPropertyName("driver_name")]
    public string DriverName { get; init; } = "rawaccel";

    public bool IsCalibrated { get; set; } = true;
    public string? LastError { get; private set; }

    [Obsolete("Use modern ProcessBatch with span slices instead", false)]
    public void ResetState()
    {
        this.LastError = null;
    }

    // --- Comprehensive For Loop Demonstration with C# Attributes ---
    [MethodImpl(MethodImplOptions.AggressiveInlining)]
    [TelemetryMetric("BatchProcessing")]
    public double ProcessBatch(int[] dataPoints, int maxLimit, bool debug)
    {
        double accumulatedTotal = 0.0;

        /* Multi-line comment:
           Tests C# attributes [TelemetryMetric], [MethodImpl], [JsonPropertyName],
           interpolated strings, pattern matching switch expressions, and loop controls. */
        for (int index = 0; index < dataPoints.Length; index++)
        {
            int currentVal = dataPoints[index];

            // 1. Guard check with break
            if (index >= maxLimit)
            {
                if (debug)
                {
                    Console.WriteLine($"[WARN] Batch limit reached at index {index}");
                }
                break;
            }

            // 2. Control flow: continue & pattern matching switch
            accumulatedTotal += currentVal switch
            {
                < 0 when debug => LogAndReturn(index, currentVal),
                0 => 0.25,
                _ => (currentVal * 1.75) + (index * 0.1)
            };

            // 3. String interpolation and threshold check
            if (debug && accumulatedTotal > 100.0)
            {
                Console.WriteLine($"Index {index} crossed threshold with sum: {accumulatedTotal:F2}");
            }
        }

        return accumulatedTotal;
    }

    private static double LogAndReturn(int index, int val)
    {
        Console.WriteLine($"[SKIP] Ignoring negative value at #{index}: {val}");
        return 0.0;
    }
}

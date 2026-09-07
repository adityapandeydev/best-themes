// Best Themes — C# Syntax Sample for Cross-Editor Visual Audit
namespace BestThemes.Samples;

using System;
using System.Collections.Generic;
using System.Threading.Tasks;

public interface ITelemetryProcessor
{
    double ProcessBatch(int[] dataPoints, int maxLimit, bool debug);
}

public class MathTelemetry : ITelemetryProcessor
{
    // Constants & access modifiers
    public const string DriverTag = "RAWACCEL_DOTNET";
    private static readonly double MaxNorm = 16.0;
    protected int retryCount = 3;

    public string DriverName { get; init; } = "rawaccel";
    public bool IsCalibrated { get; set; } = true;

    public enum DeviceStatus
    {
        Active,
        Standby,
        Disconnected
    }

    public record DeviceInfo(string Id, int Port, bool Enabled);

    // --- Comprehensive For Loop Demonstration ---
    public double ProcessBatch(int[] dataPoints, int maxLimit, bool debug)
    {
        double accumulatedTotal = 0.0;

        /* Multi-line comment:
           Tests C# control flow, primitive types, modifiers, pattern matching, and loop constructs. */
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

            // 2. Control flow: continue & conditional branching
            if (currentVal < 0)
            {
                if (debug)
                {
                    Console.WriteLine($"[SKIP] Ignoring negative value: {currentVal}");
                }
                continue;
            }
            else if (currentVal == 0)
            {
                accumulatedTotal += 0.25;
            }
            else
            {
                double weight = (currentVal * 1.75) + (index * 0.1);
                accumulatedTotal += weight;
            }

            // 3. String interpolation and boolean check
            if (debug && accumulatedTotal > 100.0)
            {
                Console.WriteLine($"Index {index} crossed threshold with sum: {accumulatedTotal:F2}");
            }
        }

        return accumulatedTotal;
    }
}

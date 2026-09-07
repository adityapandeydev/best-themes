// Best Themes — C++ Syntax Sample for Cross-Editor Visual Audit
#include <iostream>
#include <vector>
#include <string>
#include <iomanip>

namespace BestThemes::Analytics {

constexpr double MAX_NORM_LIMIT = 16.0;

enum class DriverMode : int {
    Default = 0,
    HighPrecision = 1,
    Legacy = 2
};

class TelemetryEngine {
public:
    explicit TelemetryEngine(std::string tag) : m_tag(std::move(tag)), m_isActive(true) {}

    // --- Comprehensive For Loop Demonstration ---
    double processBatch(const std::vector<int>& dataPoints, std::size_t maxLimit, bool verbose) {
        double accumulated = 0.0;

        /* Multi-line comment:
           Exercises C++ namespaces, classes, references, modern for loops, and stream formatting. */
        for (std::size_t idx = 0; idx < dataPoints.size(); ++idx) {
            const auto current = dataPoints[idx];

            // 1. Guard check with break
            if (idx >= maxLimit) {
                if (verbose) {
                    std::cout << "[LIMIT] Stopped at max index: " << idx << std::endl;
                }
                break;
            }

            // 2. Control flow: skip negative points
            if (current < 0) {
                if (verbose) {
                    std::cout << "[SKIP] Skipping negative point: " << current << std::endl;
                }
                continue;
            } else if (current == 0) {
                accumulated += 0.5;
            } else {
                double computed = static_cast<double>(current) * 1.85 + (idx * 0.2);
                accumulated += computed;
            }

            // 3. Formatted stream output
            if (verbose && (idx % 2 == 0)) {
                std::cout << "[" << m_tag << "] Index " << idx 
                          << ": current=" << current 
                          << ", sum=" << std::fixed << std::setprecision(2) << accumulated 
                          << std::endl;
            }
        }

        return accumulated;
    }

private:
    std::string m_tag;
    bool m_isActive;
};

} // namespace BestThemes::Analytics

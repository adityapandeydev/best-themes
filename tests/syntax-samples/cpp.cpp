// Best Themes — C++ Syntax Sample for Cross-Editor Visual Audit
#include <iostream>
#include <vector>
#include <string>
#include <iomanip>
#include <memory>
#include <concepts>

namespace BestThemes::Analytics {

// Global compile-time constants
constexpr double MAX_NORM_LIMIT = 16.0;
constexpr int BUFFER_CAPACITY = 514;

// Scoped enum with explicit underlying type
enum class DriverMode : int {
    Default = 0,
    HighPrecision = 1,
    Legacy = 2
};

// --- Template Structure with C++ Attributes ---
template <typename T>
struct [[nodiscard]] MetricSample {
    std::size_t id;
    T value;
    bool isValid;
};

class TelemetryEngine {
private:
    std::string m_tag;
    bool m_isActive;
    mutable std::size_t m_queryCount{0};

public:
    explicit TelemetryEngine(std::string tag) 
        : m_tag(std::move(tag)), m_isActive(true) {}

    // Method attributes (C++ decorators)
    [[nodiscard]]
    bool isActive() const noexcept {
        return this->m_isActive;
    }

    [[deprecated("Use processBatchV2 instead")]]
    void legacySync() const {
        ++this->m_queryCount;
    }

    // --- Comprehensive For Loop Demonstration with Modern C++ Features ---
    [[nodiscard]]
    double processBatch(const std::vector<int>& dataPoints, std::size_t maxLimit, bool verbose) {
        double accumulated = 0.0;

        // Lambda closure with explicit capture and return type
        auto scaler = [](int val, double factor) noexcept -> double {
            return static_cast<double>(val) * factor;
        };

        /* Multi-line comment:
           Exercises C++ namespaces, attributes [[nodiscard]], [[deprecated]],
           lambdas, structured control flow, and formatted streams. */
        for (std::size_t idx = 0; idx < dataPoints.size(); ++idx) {
            [[maybe_unused]] const auto current = dataPoints[idx];

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
                double computed = scaler(current, 1.85) + (static_cast<double>(idx) * 0.2);
                accumulated += computed;
            }

            // 3. Formatted stream output
            if (verbose && (idx % 2 == 0)) {
                std::cout << "[" << this->m_tag << "] Index " << idx 
                          << ": current=" << current 
                          << ", sum=" << std::fixed << std::setprecision(2) << accumulated 
                          << std::endl;
            }
        }

        return accumulated;
    }
};

} // namespace BestThemes::Analytics

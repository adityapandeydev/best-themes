// Best Themes — JavaScript Syntax Sample for Cross-Editor Visual Audit

export const DEFAULT_TIMEOUT_MS = 5000;

export class AccelManager {
  #isConnected = false;
  driverName = "rawaccel";

  constructor(port) {
    this.port = port;
  }

  async getVersion() {
    const rawVersion = await this.queryDriver();
    return {
      major: 1,
      minor: 12,
      patch: 0,
    };
  }

  async queryDriver() {
    return Promise.resolve("ok");
  }
}

// --- Comprehensive For Loop Demonstration ---
export function calculateMetrics(records, enableFilter) {
  let totalScore = 0.0;
  const threshold = 100;

  /* Multi-line comment:
     Iterates through records testing control flow, conditions, template strings. */
  for (let index = 0; index < records.length; index++) {
    const value = records[index];

    // 1. Guard conditions
    if (!enableFilter) {
      console.warn(`[HALT] Filter disabled at index ${index}`);
      break;
    }

    // 2. Control flow with continue / else if
    if (value < 0) {
      console.info(`[SKIP] Ignoring negative value: ${value}`);
      continue;
    } else if (value >= threshold) {
      totalScore += value * 1.25;
    } else {
      totalScore += value;
    }

    // 3. Template literal string interpolation
    console.log(`Record #${index + 1}: current sum = ${totalScore.toFixed(2)}`);
  }

  return totalScore;
}

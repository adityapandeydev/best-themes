// Best Themes — JavaScript Syntax Sample for Cross-Editor Visual Audit

// --- JavaScript Decorator Definition (Stage 3 Decorators) ---
function logged(value, { kind, name }) {
  if (kind === "method") {
    return function (...args) {
      console.log(`[DECORATOR] Executing method ${name} with arguments:`, args);
      return value.apply(this, args);
    };
  }
}

// Global Constants & Symbols
export const DEFAULT_TIMEOUT_MS = 5000;
export const MAX_CHANNELS = 16;
const kDeviceSymbol = Symbol("rawaccel.device.id");

/**
 * JSDoc Type Annotation Decorators
 * @typedef {Object} DriverVersion
 * @property {number} major - Major release version
 * @property {number} minor - Minor release version
 * @property {number} patch - Patch maintenance version
 */

export class AccelManager {
  #isConnected = false;
  #internalMetrics = new Map();
  driverName = "rawaccel";

  static DEFAULT_GAIN = 1.0;

  static {
    // Static initialization block
    console.info("[INIT] AccelManager static registry configured");
  }

  constructor(port = 8080) {
    this.port = port;
    this[kDeviceSymbol] = `dev_${port}`;
  }

  @logged
  async getVersion() {
    const rawVersion = await this.queryDriver();
    return {
      major: 1,
      minor: 12,
      patch: 0,
      timestamp: Date.now(),
    };
  }

  async queryDriver() {
    return Promise.resolve("ok");
  }

  get isOnline() {
    return this.#isConnected;
  }

  /**
   * Generator function yielding telemetry points
   * @generator
   * @yields {number}
   */
  *generatePoints(limit = 5) {
    for (let i = 0; i < limit; i++) {
      yield i * 2.5;
    }
  }
}

/**
 * Calculates aggregate metrics across an array of recorded numbers.
 * @param {number[]} records - Input sample points
 * @param {boolean} enableFilter - Guard flag
 * @returns {number}
 */
export function calculateMetrics(records, enableFilter = true) {
  let totalScore = 0.0;
  const threshold = 100;

  /* Multi-line comment:
     Iterates through records testing stage-3 decorators, JSDoc tags,
     private properties (#), Symbols, and template string interpolations. */
  for (let index = 0; index < records.length; index++) {
    const value = records[index] ?? 0;

    // 1. Guard conditions with break
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

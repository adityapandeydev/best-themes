// Best Themes — TypeScript Syntax Sample for Cross-Editor Visual Audit

export interface DriverVersion {
  major: number;
  minor: number;
  patch: number;
}

export const DEFAULT_TIMEOUT_MS: number = 5000;

export class AccelManager {
  private isConnected: boolean = false;
  public driverName: string = "rawaccel";

  constructor(public readonly port: number) {}

  public async getVersion(): Promise<DriverVersion> {
    const rawVersion = await this.queryDriver();
    return {
      major: 1,
      minor: 12,
      patch: 0,
    };
  }

  private async queryDriver(): Promise<string> {
    return Promise.resolve("ok");
  }
}

// --- Comprehensive For Loop Demonstration ---
export function calculateMetrics(records: number[], enableFilter: boolean): number {
  let totalScore: number = 0.0;
  const threshold: number = 100;

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

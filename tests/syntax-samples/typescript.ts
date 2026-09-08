// Best Themes — TypeScript Syntax Sample for Cross-Editor Visual Audit

// --- Decorator Definitions ---
function sealed(constructor: Function) {
  Object.seal(constructor);
  Object.seal(constructor.prototype);
}

function logged(target: any, propertyKey: string, descriptor: PropertyDescriptor): PropertyDescriptor {
  const originalMethod = descriptor.value;
  descriptor.value = function (...args: any[]) {
    console.log(`[DECORATOR] Calling ${propertyKey} with args:`, args);
    return originalMethod.apply(this, args);
  };
  return descriptor;
}

// --- Global Constants & Enums ---
export const DEFAULT_TIMEOUT_MS: number = 5000;
export const MAX_RETRY_COUNT: number = 3;

export enum DeviceMode {
  Classic = "CLASSIC",
  Natural = "NATURAL",
  Synchronous = "SYNCHRONOUS",
  NoAccel = "NO_ACCEL",
}

export type ConnectionStatus = "connected" | "disconnected" | "calibrating";

// --- Interfaces & Generics ---
export interface DriverVersion {
  readonly major: number;
  readonly minor: number;
  readonly patch: number;
  readonly mode: DeviceMode;
}

export interface TelemetryContainer<T extends object> {
  payload: T;
  timestamp: number;
  status: ConnectionStatus;
}

// --- Decorated Class Implementation ---
@sealed
export class AccelManager {
  private isConnected: boolean = false;
  public driverName: string = "rawaccel";
  #secretToken: string = "k_sec_99482";

  constructor(public readonly port: number, private readonly timeoutMs: number = DEFAULT_TIMEOUT_MS) {}

  @logged
  public async getVersion(): Promise<DriverVersion> {
    const rawVersion = await this.queryDriver();
    return {
      major: 1,
      minor: 12,
      patch: 0,
      mode: DeviceMode.Classic,
    };
  }

  private async queryDriver(): Promise<string> {
    return Promise.resolve("ok");
  }

  public get connectionState(): ConnectionStatus {
    return this.isConnected ? "connected" : "disconnected";
  }
}

// --- Comprehensive For Loop Demonstration with TypeScript Semantics ---
export function calculateMetrics(records: number[], enableFilter: boolean): number {
  let totalScore: number = 0.0;
  const threshold: number = 100;

  /* Multi-line comment:
     Iterates through records testing decorators, private fields (#), enums,
     generics, control flow, conditions, and template string interpolations. */
  for (let index = 0; index < records.length; index++) {
    const value = records[index];

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

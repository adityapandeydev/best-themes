// Best Themes — React / TSX Syntax Sample for Cross-Editor Visual Audit

import React, { useState, useEffect, useCallback, useMemo, useRef } from "react";

// --- Enums & Generic Prop Interfaces ---
export enum TelemetrySeverity {
  Info = "INFO",
  Warning = "WARN",
  Critical = "CRIT",
}

export interface TelemetryCardProps<T extends object = Record<string, unknown>> {
  title: string;
  initialCount?: number;
  isActive: boolean;
  metadata?: T;
  severity?: TelemetrySeverity;
  onStatusChange: (status: "idle" | "running" | "error") => void;
}

// --- Higher-Order Component (Decorator Pattern in React) ---
export function withTelemetryTracking<P extends object>(
  WrappedComponent: React.ComponentType<P>,
  trackingTag: string
): React.FC<P> {
  const TrackedComponent: React.FC<P> = (props) => {
    useEffect(() => {
      console.log(`[HOC-DECORATOR] Mounted component with tag: ${trackingTag}`);
    }, []);
    return <WrappedComponent {...props} />;
  };
  TrackedComponent.displayName = `WithTelemetry(${trackingTag})`;
  return TrackedComponent;
}

// --- Functional Component with Comprehensive Hooks & JSX ---
export const BaseTelemetryCard: React.FC<TelemetryCardProps> = ({
  title,
  initialCount = 0,
  isActive,
  severity = TelemetrySeverity.Info,
  onStatusChange,
}) => {
  const [counter, setCounter] = useState<number>(initialCount);
  const [status, setStatus] = useState<string>("idle");
  const renderCount = useRef<number>(0);

  renderCount.current += 1;

  const severityColor = useMemo(() => {
    switch (severity) {
      case TelemetrySeverity.Critical:
        return "#e0687a";
      case TelemetrySeverity.Warning:
        return "#e0af68";
      default:
        return "#89ddff";
    }
  }, [severity]);

  const handleIncrement = useCallback(() => {
    setCounter((prev) => prev + 1);
  }, []);

  useEffect(() => {
    if (counter > 100) {
      setStatus("running");
      onStatusChange("running");
    }
  }, [counter, onStatusChange]);

  return (
    <section className="telemetry-card" data-active={isActive}>
      <header className="card-header" style={{ borderColor: severityColor }}>
        <h2 className="title">{title}</h2>
        <span className={`status-badge status-${status}`}>
          Status: {status.toUpperCase()} ({severity})
        </span>
      </header>

      <main className="card-body">
        <p className="description">
          Current cycle count: <strong>{counter}</strong> (Renders: {renderCount.current})
        </p>

        <div className="button-group">
          <button
            type="button"
            className="btn btn-primary"
            onClick={handleIncrement}
            disabled={!isActive}
          >
            Increment
          </button>
          <button
            type="button"
            className="btn btn-secondary"
            onClick={() => setCounter(0)}
          >
            Reset
          </button>
        </div>
      </main>
    </section>
  );
};

export const TelemetryCard = withTelemetryTracking(BaseTelemetryCard, "RAWACCEL_PANEL");

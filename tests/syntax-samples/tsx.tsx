// Best Themes — React / TSX Syntax Sample for Cross-Editor Visual Audit

import React, { useState, useEffect, useCallback } from "react";

export interface TelemetryCardProps {
  title: string;
  initialCount?: number;
  isActive: boolean;
  onStatusChange: (status: "idle" | "running" | "error") => void;
}

export const TelemetryCard: React.FC<TelemetryCardProps> = ({
  title,
  initialCount = 0,
  isActive,
  onStatusChange,
}) => {
  const [counter, setCounter] = useState<number>(initialCount);
  const [status, setStatus] = useState<string>("idle");

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
      <header className="card-header">
        <h2 className="title">{title}</h2>
        <span className={`status-badge status-${status}`}>
          Status: {status.toUpperCase()}
        </span>
      </header>

      <main className="card-body">
        <p className="description">
          Current cycle count: <strong>{counter}</strong>
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

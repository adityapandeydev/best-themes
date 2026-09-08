// Best Themes — React / JSX Syntax Sample for Cross-Editor Visual Audit

import React, { useState, useEffect, useCallback, useMemo } from "react";

// --- Higher-Order Component (Decorator Pattern in React JSX) ---
export const withTelemetryLogger = (WrappedComponent, componentTag = "RAWACCEL_JSX") => {
  return function EnhancedComponent(props) {
    useEffect(() => {
      console.log(`[DECORATOR-HOC] Mounted JSX component: ${componentTag}`);
    }, []);

    return <WrappedComponent {...props} trackingTag={componentTag} />;
  };
};

const BaseTelemetryCard = ({
  title = "Telemetry Dashboard",
  initialCount = 0,
  isActive = true,
  trackingTag = "DEFAULT_TAG",
  onStatusChange = () => {},
}) => {
  const [counter, setCounter] = useState(initialCount);
  const [status, setStatus] = useState("idle");

  const badgeColor = useMemo(() => {
    return status === "running" ? "#94e2d5" : "#89ddff";
  }, [status]);

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
    <section className="telemetry-card" data-active={isActive} data-tag={trackingTag}>
      <header className="card-header" style={{ borderColor: badgeColor }}>
        <h2 className="title">{title}</h2>
        <span className={`status-badge status-${status}`}>
          Status: {status.toUpperCase()} [{trackingTag}]
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

export const TelemetryCard = withTelemetryLogger(BaseTelemetryCard, "RAWACCEL_METRICS");

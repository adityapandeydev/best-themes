# Best Themes — Python Syntax Sample for Cross-Editor Visual Audit

import os
from typing import List, Optional, Tuple

DEFAULT_MAX_NORM: float = 16.0

class DriverClient:
    """Manages low-level IO communication with the kernel driver."""

    def __init__(self, endpoint: str) -> None:
        self.endpoint: str = endpoint
        self._is_active: bool = True

    @property
    def is_active(self) -> bool:
        return self._is_active

    def get_version(self) -> Tuple[int, int, int]:
        if not self._is_active:
            raise RuntimeError("Driver is not connected")
        return (1, 12, 0)

# --- Comprehensive For Loop Demonstration ---
def compute_telemetry(metrics: List[float], max_samples: int, verbose: bool = True) -> float:
    """Demonstrates for loops with control flow, conditions, and formatting."""
    aggregate_score: float = 0.0

    # Multi-line demonstration: index and value enumeration
    for idx, reading in enumerate(metrics):
        # 1. Condition check with break
        if idx >= max_samples:
            if verbose:
                print(f"[LIMIT] Reached maximum allowed samples: {max_samples}")
            break

        # 2. Filtering negative readings with continue
        if reading < 0.0:
            if verbose:
                print(f"[SKIP] Negative reading encountered at #{idx}: {reading}")
            continue
        elif reading == 0.0:
            aggregate_score += 0.1
        else:
            weighted_val: float = reading * 1.5 + float(idx)
            aggregate_score += weighted_val

        # 3. Formatted f-string output
        if verbose:
            print(f"Index [{idx:02d}]: val={reading:.2f}, running_sum={aggregate_score:.2f}")

    return aggregate_score

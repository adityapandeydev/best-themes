# Best Themes — Python Syntax Sample for Cross-Editor Visual Audit
from dataclasses import dataclass, field
from enum import Enum, unique
import functools
import time
from typing import Callable, Dict, List, Optional, Tuple, Union

# --- Constants ---
DEFAULT_MAX_NORM: float = 16.0
NORMALIZED_DPI: float = 1000.0
DRIVER_ENDPOINT: str = "/dev/rawaccel"

# --- Enums with Decorators ---
@unique
class AccelMode(Enum):
    """Enumeration of available acceleration algorithm modes."""
    CLASSIC = 0
    JUMP = 1
    NATURAL = 2
    SYNCHRONOUS = 3
    POWER = 4
    LOOKUP = 5
    TIERED = 6
    NO_ACCEL = 7

# --- Custom Decorator Implementation ---
def trace_execution(retries: int = 3, verbose: bool = True) -> Callable:
    """Demonstrates custom higher-order function decorator with arguments."""
    def decorator(func: Callable) -> Callable:
        @functools.wraps(func)
        def wrapper(*args, **kwargs):
            if verbose:
                print(f"[TRACE] Executing {func.__name__} (configured retries: {retries})")
            start_time = time.perf_counter()
            result = func(*args, **kwargs)
            duration = time.perf_counter() - start_time
            return result
        return wrapper
    return decorator

# --- Dataclass with Decorator ---
@dataclass(frozen=True)
class TelemetryRecord:
    device_id: str
    mode: AccelMode = AccelMode.CLASSIC
    samples: List[float] = field(default_factory=list)
    is_valid: bool = True

# --- Class Demonstrating Various Method Decorators ---
class DriverClient:
    """Manages low-level IO communication with the kernel driver."""

    DRIVER_VERSION: Tuple[int, int, int] = (1, 12, 0)

    def __init__(self, endpoint: str = DRIVER_ENDPOINT) -> None:
        self.endpoint: str = endpoint
        self._is_active: bool = True
        self._scale: float = 1.0

    @property
    def is_active(self) -> bool:
        """Property getter decorator."""
        return self._is_active

    @is_active.setter
    def is_active(self, value: bool) -> None:
        """Property setter decorator."""
        self._is_active = value

    @classmethod
    def get_supported_modes(cls) -> List[AccelMode]:
        """Class method decorator using cls parameter."""
        return [mode for mode in AccelMode]

    @staticmethod
    def calculate_norm(x: float, y: float) -> float:
        """Static method decorator with mathematical logic."""
        return (x ** 2 + y ** 2) ** 0.5

    @trace_execution(retries=5, verbose=True)
    def query_version(self) -> Tuple[int, int, int]:
        if not self._is_active:
            raise RuntimeError("Driver is not connected")
        return self.DRIVER_VERSION

# --- Comprehensive For Loop Demonstration ---
def compute_telemetry(metrics: List[float], max_samples: int, verbose: bool = True) -> float:
    """Demonstrates for loops with control flow, conditions, and formatting."""
    aggregate_score: float = 0.0

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

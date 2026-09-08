// Best Themes — Go Syntax Sample for Cross-Editor Visual Audit
//go:build !ignore

package main

import (
	"context"
	"errors"
	"fmt"
	"math"
	"time"
)

// Global compile-time constants
const (
	DriverName    string  = "rawaccel"
	MaxMultiplier float64 = 16.0
	DefaultPort   int     = 8080
	BufferLimit   int     = 514
)

// Enum declaration via iota
type DeviceMode int

const (
	ModeClassic DeviceMode = iota
	ModeNatural
	ModeSynchronous
	ModeNoAccel
)

func (m DeviceMode) String() string {
	switch m {
	case ModeClassic:
		return "Classic"
	case ModeNatural:
		return "Natural"
	case ModeSynchronous:
		return "Synchronous"
	default:
		return "NoAccel"
	}
}

// Interface definition
type TelemetryReader interface {
	ReadTelemetry(ctx context.Context) (float64, error)
	IsActive() bool
}

// Struct with field tags (Go's structural decorators)
type DeviceConfig struct {
	ID        string     `json:"device_id" db:"pk,autoincrement"`
	IsEnabled bool       `json:"is_enabled" yaml:"enabled"`
	Gain      float64    `json:"gain_multiplier"`
	Mode      DeviceMode `json:"device_mode"`
}

// Pointer receiver method
func (d *DeviceConfig) SetGain(newGain float64) error {
	if newGain < 0.0 || newGain > MaxMultiplier {
		return errors.New("gain out of permissible range")
	}
	d.Gain = newGain
	return nil
}

// Value receiver method
func (d DeviceConfig) IsActive() bool {
	return d.IsEnabled
}

// Comprehensive For Loop Demonstration with Compiler Directive
//go:noinline
func ProcessReadings(readings []float64, maxLimit int, verbose bool) (float64, error) {
	var runningTotal float64 = 0.0

	/* Multi-line comment:
	   Validates Go compiler directives (//go:noinline), struct field tags,
	   iota enums, multiple returns, defer, and range operators. */
	defer func(start time.Time) {
		if verbose {
			fmt.Printf("[PERF] Elapsed execution time: %v\n", time.Since(start))
		}
	}(time.Now())

	for index, reading := range readings {
		// 1. Guard check with break
		if index >= maxLimit {
			if verbose {
				fmt.Printf("[BREAK] Exceeded maximum limit of %d items\n", maxLimit)
			}
			break
		}

		// 2. Control flow: skip negative readings with continue
		if reading < 0.0 {
			if verbose {
				fmt.Printf("[SKIP] Negative reading at index %d: %.2f\n", index, reading)
			}
			continue
		} else if math.Abs(reading) < 0.001 {
			runningTotal += 0.05
		} else {
			weighted := (reading * 1.5) + float64(index)*0.2
			runningTotal += weighted
		}

		// 3. Formatted string printing
		if verbose && (index%2 == 0) {
			fmt.Printf("Point #%d -> val=%.2f, total=%.2f\n", index, reading, runningTotal)
		}
	}

	return runningTotal, nil
}

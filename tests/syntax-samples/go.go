// Best Themes — Go Syntax Sample for Cross-Editor Visual Audit
package main

import (
	"fmt"
	"math"
)

// Constants and types
const (
	DriverName    string  = "rawaccel"
	MaxMultiplier float64 = 16.0
	DefaultPort   int     = 8080
)

type DeviceMode int

const (
	ModeClassic DeviceMode = iota
	ModeNatural
	ModeSynchronous
)

type DeviceConfig struct {
	ID        string
	IsEnabled bool
	Gain      float64
}

// Comprehensive For Loop Demonstration
func ProcessReadings(readings []float64, maxLimit int, verbose bool) float64 {
	var runningTotal float64 = 0.0

	/* Multi-line comment:
	   Validates Go keyword, range operator, conditions, format verbs, and comments. */
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
		if verbose {
			fmt.Printf("Point #%d -> val=%.2f, total=%.2f\n", index, reading, runningTotal)
		}
	}

	return runningTotal
}

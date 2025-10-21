package appErrors

import (
	"errors"
	"fmt"
)

// Stats
type NoRecoommendedStatsForCr struct {
	Cr   string
	Wrap error
}

func (e *NoRecoommendedStatsForCr) Error() string {
	return fmt.Sprintf("No recommended stats were found for %v. (%v)", e.Cr, e.Wrap)
}

func (e *NoRecoommendedStatsForCr) Unwrap() error {
	return e.Wrap
}

func IsNoRecoommendedStatsForCr(err error) bool {
	if err == nil {
		return false
	}
	var target *NoRecoommendedStatsForCr
	return errors.As(err, &target)
}

// Spellslots
type NoRecoommendedSpellSlotsForCr struct {
	Cr   string
	Wrap error
}

func (e *NoRecoommendedSpellSlotsForCr) Error() string {
	return fmt.Sprintf("No recommended spell slots were found for %v. (%v)", e.Cr, e.Wrap)
}

func (e *NoRecoommendedSpellSlotsForCr) Unwrap() error {
	return e.Wrap
}

func IsNoRecoommendedSpellSlotsForCr(err error) bool {
	if err == nil {
		return false
	}
	var target *NoRecoommendedSpellSlotsForCr
	return errors.As(err, &target)
}

type UnknownDifficultyError struct {
	Difficulty string
	Wrap       error
}

func (e *UnknownDifficultyError) Error() string {
	return fmt.Sprintf("difficulty %v is unknown. (%v)", e.Difficulty, e.Wrap)
}

func (e *UnknownDifficultyError) Unwrap() error {
	return e.Wrap
}

func IsUnknownDifficultyError(err error) bool {
	if err == nil {
		return false
	}
	var target *NoRecoommendedSpellSlotsForCr
	return errors.As(err, &target)
}

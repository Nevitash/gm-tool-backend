package appErrors

import (
	"errors"
	"fmt"

	"github.com/google/uuid"
)

type NoEncounterFoundForExternalId struct {
	ExternalId string
	GameId     uuid.UUID
	Wrap       error
}

func (e *NoEncounterFoundForExternalId) Error() string {
	return fmt.Sprintf("For the game with id '%v' no encounter with the external id '%v' was found.\n error: %v", e.GameId, e.ExternalId, e.Wrap)
}

func (e *NoEncounterFoundForExternalId) Unwrap() error {
	return e.Wrap
}

func IsNoEncounterFoundForExternalId(err error) bool {
	if err == nil {
		return false
	}
	var target *NoEncounterFoundForExternalId
	return errors.As(err, &target)
}

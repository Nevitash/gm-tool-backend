package appErrors

import (
	"errors"
	"fmt"

	"github.com/google/uuid"
)

type NoGameFound struct {
	GameId uuid.UUID
	Wrap   error
}

func (e *NoGameFound) Error() string {
	return fmt.Sprintf("No game with id '%v' found.\n error: %v", e.GameId, e.Wrap)
}

func (e *NoGameFound) Unwrap() error {
	return e.Wrap
}

func IsNoGameFound(err error) bool {
	if err == nil {
		return false
	}
	var target *NoGameFound
	return errors.As(err, &target)
}

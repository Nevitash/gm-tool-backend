package appErrors

import (
	"errors"
	"fmt"

	"github.com/google/uuid"
)

type UserAlreadyExistsError struct {
	UserName string
	Email    string
	Wrap     error
}

func (e *UserAlreadyExistsError) Error() string {
	return fmt.Sprintf("User with username '%v' or email '%v' already exists.\n error: %v", e.UserName, e.Email, e.Wrap)
}

func (e *UserAlreadyExistsError) Unwrap() error {
	return e.Wrap
}

func IsUserAlreadyExistsError(err error) bool {
	if err == nil {
		return false
	}
	var target *UserAlreadyExistsError
	return errors.As(err, &target)
}

type UserDoesNotExist struct {
	Id   uuid.UUID
	Wrap error
}

func (e *UserDoesNotExist) Error() string {
	return fmt.Sprintf("User with id '%v' does not exist.\n error: %v", e.Id, e.Wrap)
}

func (e *UserDoesNotExist) Unwrap() error {
	return e.Wrap
}

func IsUserDoesNotExist(err error) bool {
	if err == nil {
		return false
	}
	var target *UserDoesNotExist
	return errors.As(err, &target)
}

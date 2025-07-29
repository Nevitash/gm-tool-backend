package appErrors

import (
	"errors"
	"fmt"
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

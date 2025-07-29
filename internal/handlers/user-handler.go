package handlers

import (
	"context"
	"fmt"
	"gm-tool-backend/ent"
	"gm-tool-backend/internal/database"
	appErrors "gm-tool-backend/internal/errors"
	"gm-tool-backend/internal/requests"
	"net/http"

	"github.com/labstack/echo/v4"
)

func CreateUser(userName string, email string) (*ent.User, error) {
	dbClient, err := database.GetClient()
	if err != nil {
		return nil, err
	}
	userModel, err := dbClient.
		User.
		Create().
		SetName(userName).
		SetEmail(email).
		Save(context.Background())
	if ent.IsConstraintError(err) {
		return nil, &appErrors.UserAlreadyExistsError{UserName: userName, Email: email, Wrap: err}
	}
	if err != nil {
		return nil, fmt.Errorf("could not create user: %w", err)
	}
	return userModel, nil
}

func PostUser(c echo.Context) error {
	request := &requests.UserCreationRequest{}
	c.Bind(request)
	userModel, err := CreateUser(request.Name, request.Email)
	if appErrors.IsUserAlreadyExistsError(err) {
		return c.String(http.StatusBadRequest, "User couldn't be created. Try again later.")
	}
	if err != nil {
		return c.String(http.StatusBadRequest, "User couldn't be created. Try again later.")
	}
	return c.JSON(http.StatusOK, userModel)
}

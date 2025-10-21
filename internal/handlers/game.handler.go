package handlers

import (
	"fmt"
	"gm-tool-backend/internal/database"
	"gm-tool-backend/internal/requests"
	"net/http"

	"github.com/google/uuid"
	"github.com/labstack/echo/v4"
)

// @Summary Create a game for the given user id
// @Tags game
// @Accept json
// @Produce text/plain
// @Param userId path string true "The ID of the user creating the game"
// @Param game body requests.GameCreationRequest true "Game name to be created"
// @Success 201 {object} string "UUID of the newly created game"
// @Failure 400 {string} string "Game could not be created"
// @Router /{userId}/game [post]
func PostGame(c echo.Context) error {
	userId := c.Param("userId")
	userUuid, err := uuid.Parse(userId)
	if err != nil {
		return c.String(http.StatusBadRequest, fmt.Sprintf("invalid user id format.\nerror: %v", err))
	}
	request := &requests.GameCreationRequest{}
	err = c.Bind(request)
	if err != nil {
		return c.String(http.StatusBadRequest, fmt.Sprintf("invalid request format.\nerror: %v", err))
	}
	game, err := database.CreateGame(*request, userUuid)
	if err != nil {
		return c.String(http.StatusBadRequest, fmt.Sprintf("Game could not be created.\nerror: %v", err))
	}
	return c.JSON(http.StatusCreated, game.ID)
}

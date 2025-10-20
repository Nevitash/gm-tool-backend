package handlers

import (
	"fmt"
	"gm-tool-backend/internal/requests"
	"net/http"

	"github.com/labstack/echo/v4"
)

// CalculateMonsterCrForEncounter calculates monster CR for an encounter
// @Summary Calculate monster CR for encounter
// @Description Calculate the appropriate Challenge Rating for monsters in a D&D 5e encounter based on party size, level, and difficulty
// @Tags encounter-calculator
// @Accept json
// @Produce json
// @Param encounter body requests.CalculateEncounterCRsRequest true "Encounter CR calculation request"
// @Success 200 {array} requests.Monster "Calculated monster CRs and XP values"
// @Failure 400 {string} string "Bad request - invalid request format or calculation error"
// @Router /encounter-calculator [post]
func InitiativeTrackerPost(c echo.Context) error {
	gameId := c.Param("gameId")
	request := &requests.InitaitveTrackerUpdateRequest{}
	err := c.Bind(request)
	if err != nil {
		return fmt.Errorf("invalid request format: %w", err)
	}

	return c.JSON(http.StatusOK, gameId)
}

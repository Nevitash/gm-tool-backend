package handlers

import (
	"net/http"

	"gm-tool-backend/ent"
	"gm-tool-backend/ent/encountercombatant"

	"github.com/google/uuid"
	"github.com/labstack/echo/v4"
)

// AddCombatantToEncounter adds a combatant to an encounter
func AddCombatantToEncounter(client *ent.Client) echo.HandlerFunc {
	return func(c echo.Context) error {
		encounterID, err := uuid.Parse(c.Param("id"))
		if err != nil {
			return c.JSON(http.StatusBadRequest, map[string]string{"error": "Invalid encounter ID"})
		}

		var req struct {
			CombatantID   uuid.UUID `json:"combatant_id" validate:"required"`
			IsPartyMember bool      `json:"is_party_member"`
			IsFriendly    bool      `json:"is_friendly"`
			IsEnemy       bool      `json:"is_enemy"`
		}

		if err := c.Bind(&req); err != nil {
			return c.JSON(http.StatusBadRequest, map[string]string{"error": "Invalid request body"})
		}

		// Check if the relationship already exists
		exists, err := client.EncounterCombatant.
			Query().
			Where(
				encountercombatant.EncounterID(encounterID),
				encountercombatant.CombatantID(req.CombatantID),
			).
			Exist(c.Request().Context())

		if err != nil {
			return c.JSON(http.StatusInternalServerError, map[string]string{"error": err.Error()})
		}

		if exists {
			return c.JSON(http.StatusConflict, map[string]string{"error": "Combatant already added to this encounter"})
		}

		encounterCombatant, err := client.EncounterCombatant.
			Create().
			SetEncounterID(encounterID).
			SetCombatantID(req.CombatantID).
			SetIsPartyMember(req.IsPartyMember).
			SetIsFriendly(req.IsFriendly).
			SetIsEnemy(req.IsEnemy).
			Save(c.Request().Context())

		if err != nil {
			return c.JSON(http.StatusInternalServerError, map[string]string{"error": err.Error()})
		}

		return c.JSON(http.StatusCreated, encounterCombatant)
	}
}

// RemoveCombatantFromEncounter removes a combatant from an encounter
func RemoveCombatantFromEncounter(client *ent.Client) echo.HandlerFunc {
	return func(c echo.Context) error {
		encounterID, err := uuid.Parse(c.Param("encounter_id"))
		if err != nil {
			return c.JSON(http.StatusBadRequest, map[string]string{"error": "Invalid encounter ID"})
		}

		combatantID, err := uuid.Parse(c.Param("combatant_id"))
		if err != nil {
			return c.JSON(http.StatusBadRequest, map[string]string{"error": "Invalid combatant ID"})
		}

		// Find the relationship
		encounterCombatant, err := client.EncounterCombatant.
			Query().
			Where(
				encountercombatant.EncounterID(encounterID),
				encountercombatant.CombatantID(combatantID),
			).
			Only(c.Request().Context())

		if err != nil {
			if ent.IsNotFound(err) {
				return c.JSON(http.StatusNotFound, map[string]string{"error": "Combatant not found in this encounter"})
			}
			return c.JSON(http.StatusInternalServerError, map[string]string{"error": err.Error()})
		}

		// Delete the relationship
		err = client.EncounterCombatant.DeleteOne(encounterCombatant).Exec(c.Request().Context())
		if err != nil {
			return c.JSON(http.StatusInternalServerError, map[string]string{"error": err.Error()})
		}

		return c.JSON(http.StatusOK, map[string]string{"message": "Combatant removed from encounter successfully"})
	}
}

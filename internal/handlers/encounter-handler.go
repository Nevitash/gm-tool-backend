package handlers

import (
	"net/http"

	"gm-tool-backend/ent"
	"gm-tool-backend/ent/encounter"

	"github.com/google/uuid"
	"github.com/labstack/echo/v4"
)

// GetEncounters returns all encounters
func GetEncounters(client *ent.Client) echo.HandlerFunc {
	return func(c echo.Context) error {
		encounters, err := client.Encounter.Query().All(c.Request().Context())
		if err != nil {
			return c.JSON(http.StatusInternalServerError, map[string]string{"error": err.Error()})
		}
		return c.JSON(http.StatusOK, encounters)
	}
}

// CreateEncounter creates a new encounter
func CreateEncounter(client *ent.Client) echo.HandlerFunc {
	return func(c echo.Context) error {
		var req struct {
			Name   string    `json:"name" validate:"required"`
			UserID uuid.UUID `json:"user_id" validate:"required"`
		}

		if err := c.Bind(&req); err != nil {
			return c.JSON(http.StatusBadRequest, map[string]string{"error": "Invalid request body"})
		}

		encounter, err := client.Encounter.
			Create().
			SetName(req.Name).
			SetUserID(req.UserID).
			Save(c.Request().Context())

		if err != nil {
			return c.JSON(http.StatusInternalServerError, map[string]string{"error": err.Error()})
		}

		return c.JSON(http.StatusCreated, encounter)
	}
}

// GetEncounter returns a specific encounter by ID
func GetEncounter(client *ent.Client) echo.HandlerFunc {
	return func(c echo.Context) error {
		id, err := uuid.Parse(c.Param("id"))
		if err != nil {
			return c.JSON(http.StatusBadRequest, map[string]string{"error": "Invalid encounter ID"})
		}

		encounter, err := client.Encounter.
			Query().
			Where(encounter.ID(id)).
			WithEncounterCombatants().
			Only(c.Request().Context())

		if err != nil {
			if ent.IsNotFound(err) {
				return c.JSON(http.StatusNotFound, map[string]string{"error": "Encounter not found"})
			}
			return c.JSON(http.StatusInternalServerError, map[string]string{"error": err.Error()})
		}

		return c.JSON(http.StatusOK, encounter)
	}
}

// UpdateEncounter updates an existing encounter
func UpdateEncounter(client *ent.Client) echo.HandlerFunc {
	return func(c echo.Context) error {
		id, err := uuid.Parse(c.Param("id"))
		if err != nil {
			return c.JSON(http.StatusBadRequest, map[string]string{"error": "Invalid encounter ID"})
		}

		var req struct {
			Name   string    `json:"name"`
			UserID uuid.UUID `json:"user_id"`
		}

		if err := c.Bind(&req); err != nil {
			return c.JSON(http.StatusBadRequest, map[string]string{"error": "Invalid request body"})
		}

		updateQuery := client.Encounter.UpdateOneID(id)

		if req.Name != "" {
			updateQuery = updateQuery.SetName(req.Name)
		}
		if req.UserID != uuid.Nil {
			updateQuery = updateQuery.SetUserID(req.UserID)
		}

		encounter, err := updateQuery.Save(c.Request().Context())
		if err != nil {
			if ent.IsNotFound(err) {
				return c.JSON(http.StatusNotFound, map[string]string{"error": "Encounter not found"})
			}
			return c.JSON(http.StatusInternalServerError, map[string]string{"error": err.Error()})
		}

		return c.JSON(http.StatusOK, encounter)
	}
}

// DeleteEncounter deletes an encounter
func DeleteEncounter(client *ent.Client) echo.HandlerFunc {
	return func(c echo.Context) error {
		id, err := uuid.Parse(c.Param("id"))
		if err != nil {
			return c.JSON(http.StatusBadRequest, map[string]string{"error": "Invalid encounter ID"})
		}

		err = client.Encounter.DeleteOneID(id).Exec(c.Request().Context())
		if err != nil {
			if ent.IsNotFound(err) {
				return c.JSON(http.StatusNotFound, map[string]string{"error": "Encounter not found"})
			}
			return c.JSON(http.StatusInternalServerError, map[string]string{"error": err.Error()})
		}

		return c.JSON(http.StatusOK, map[string]string{"message": "Encounter deleted successfully"})
	}
}

// GetEncounterCombatants returns all combatants for a specific encounter
func GetEncounterCombatants(client *ent.Client) echo.HandlerFunc {
	return func(c echo.Context) error {
		encounterID, err := uuid.Parse(c.Param("id"))
		if err != nil {
			return c.JSON(http.StatusBadRequest, map[string]string{"error": "Invalid encounter ID"})
		}

		// Get encounter with combatants
		encounter, err := client.Encounter.
			Query().
			Where(encounter.ID(encounterID)).
			WithEncounterCombatants(func(q *ent.EncounterCombatantQuery) {
				q.WithCombatant()
			}).
			Only(c.Request().Context())

		if err != nil {
			if ent.IsNotFound(err) {
				return c.JSON(http.StatusNotFound, map[string]string{"error": "Encounter not found"})
			}
			return c.JSON(http.StatusInternalServerError, map[string]string{"error": err.Error()})
		}

		return c.JSON(http.StatusOK, encounter.Edges.EncounterCombatants)
	}
}

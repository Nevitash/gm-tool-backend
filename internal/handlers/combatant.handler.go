package handlers

import (
	"net/http"

	"gm-tool-backend/ent"
	"gm-tool-backend/ent/combatant"

	"github.com/google/uuid"
	"github.com/labstack/echo/v4"
)

// GetCombatants returns all combatants
func GetCombatants(client *ent.Client) echo.HandlerFunc {
	return func(c echo.Context) error {
		combatants, err := client.Combatant.Query().All(c.Request().Context())
		if err != nil {
			return c.JSON(http.StatusInternalServerError, map[string]string{"error": err.Error()})
		}
		return c.JSON(http.StatusOK, combatants)
	}
}

// CreateCombatant creates a new combatant
func CreateCombatant(client *ent.Client) echo.HandlerFunc {
	return func(c echo.Context) error {
		var req struct {
			Name        string  `json:"name" validate:"required"`
			CR          float64 `json:"cr" validate:"required"`
			AC          int     `json:"ac" validate:"required"`
			HP          int     `json:"hp" validate:"required"`
			HitDice     string  `json:"hit_dice" validate:"required"`
			SpeedMod    int     `json:"speed_mod"`
			DC          int     `json:"dc" validate:"required"`
			Damage      float64 `json:"damage" validate:"required"`
			IsBoss      bool    `json:"is_boss"`
			IsLegendary bool    `json:"is_legendary"`
		}

		if err := c.Bind(&req); err != nil {
			return c.JSON(http.StatusBadRequest, map[string]string{"error": "Invalid request body"})
		}

		combatant, err := client.Combatant.
			Create().
			SetName(req.Name).
			SetCr(req.CR).
			SetAc(req.AC).
			SetHp(req.HP).
			SetHitDice(req.HitDice).
			SetSpeedMod(req.SpeedMod).
			SetDc(req.DC).
			SetDamage(req.Damage).
			SetIsBoss(req.IsBoss).
			SetIsLegendary(req.IsLegendary).
			Save(c.Request().Context())

		if err != nil {
			return c.JSON(http.StatusInternalServerError, map[string]string{"error": err.Error()})
		}

		return c.JSON(http.StatusCreated, combatant)
	}
}

// GetCombatant returns a specific combatant by ID
func GetCombatant(client *ent.Client) echo.HandlerFunc {
	return func(c echo.Context) error {
		id, err := uuid.Parse(c.Param("id"))
		if err != nil {
			return c.JSON(http.StatusBadRequest, map[string]string{"error": "Invalid combatant ID"})
		}

		combatant, err := client.Combatant.
			Query().
			Where(combatant.ID(id)).
			WithEncounterCombatants().
			Only(c.Request().Context())

		if err != nil {
			if ent.IsNotFound(err) {
				return c.JSON(http.StatusNotFound, map[string]string{"error": "Combatant not found"})
			}
			return c.JSON(http.StatusInternalServerError, map[string]string{"error": err.Error()})
		}

		return c.JSON(http.StatusOK, combatant)
	}
}

// UpdateCombatant updates an existing combatant
func UpdateCombatant(client *ent.Client) echo.HandlerFunc {
	return func(c echo.Context) error {
		id, err := uuid.Parse(c.Param("id"))
		if err != nil {
			return c.JSON(http.StatusBadRequest, map[string]string{"error": "Invalid combatant ID"})
		}

		var req struct {
			Name        *string  `json:"name"`
			CR          *float64 `json:"cr"`
			AC          *int     `json:"ac"`
			HP          *int     `json:"hp"`
			HitDice     *string  `json:"hit_dice"`
			SpeedMod    *int     `json:"speed_mod"`
			DC          *int     `json:"dc"`
			Damage      *float64 `json:"damage"`
			IsBoss      *bool    `json:"is_boss"`
			IsLegendary *bool    `json:"is_legendary"`
		}

		if err := c.Bind(&req); err != nil {
			return c.JSON(http.StatusBadRequest, map[string]string{"error": "Invalid request body"})
		}

		updateQuery := client.Combatant.UpdateOneID(id)

		if req.Name != nil {
			updateQuery = updateQuery.SetName(*req.Name)
		}
		if req.CR != nil {
			updateQuery = updateQuery.SetCr(*req.CR)
		}
		if req.AC != nil {
			updateQuery = updateQuery.SetAc(*req.AC)
		}
		if req.HP != nil {
			updateQuery = updateQuery.SetHp(*req.HP)
		}
		if req.HitDice != nil {
			updateQuery = updateQuery.SetHitDice(*req.HitDice)
		}
		if req.SpeedMod != nil {
			updateQuery = updateQuery.SetSpeedMod(*req.SpeedMod)
		}
		if req.DC != nil {
			updateQuery = updateQuery.SetDc(*req.DC)
		}
		if req.Damage != nil {
			updateQuery = updateQuery.SetDamage(*req.Damage)
		}
		if req.IsBoss != nil {
			updateQuery = updateQuery.SetIsBoss(*req.IsBoss)
		}
		if req.IsLegendary != nil {
			updateQuery = updateQuery.SetIsLegendary(*req.IsLegendary)
		}

		combatant, err := updateQuery.Save(c.Request().Context())
		if err != nil {
			if ent.IsNotFound(err) {
				return c.JSON(http.StatusNotFound, map[string]string{"error": "Combatant not found"})
			}
			return c.JSON(http.StatusInternalServerError, map[string]string{"error": err.Error()})
		}

		return c.JSON(http.StatusOK, combatant)
	}
}

// DeleteCombatant deletes a combatant
func DeleteCombatant(client *ent.Client) echo.HandlerFunc {
	return func(c echo.Context) error {
		id, err := uuid.Parse(c.Param("id"))
		if err != nil {
			return c.JSON(http.StatusBadRequest, map[string]string{"error": "Invalid combatant ID"})
		}

		err = client.Combatant.DeleteOneID(id).Exec(c.Request().Context())
		if err != nil {
			if ent.IsNotFound(err) {
				return c.JSON(http.StatusNotFound, map[string]string{"error": "Combatant not found"})
			}
			return c.JSON(http.StatusInternalServerError, map[string]string{"error": err.Error()})
		}

		return c.JSON(http.StatusOK, map[string]string{"message": "Combatant deleted successfully"})
	}
}

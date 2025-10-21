package requests

import "gm-tool-backend/internal/models"

// Define constants for each webhook event.
type InitaitveTrackerUpdateRequest struct {
	EventType      models.WebhookEvent                 `json:"eventType"`
	Step           int32                               `json:"step"`
	Combatants     []models.InitiativeTrackerCombatant `json:"order"`
	EncounterState models.ExternalEncounterState       `json:"encounter"`
	Changes        []models.CombatantChanges           `json:"changes"`
}

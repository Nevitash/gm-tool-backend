package models

import "github.com/google/uuid"

type InitiativeTrackerCombatant struct {
	Active      bool     `json:"active"`
	Name        string   `json:"name"`
	Modifier    int      `json:"modifier"`
	HP          int      `json:"hp"`
	Temp        int      `json:"temp"`
	AC          string   `json:"ac"`
	CurrentAC   int      `json:"current_ac"`
	DirtyAC     bool     `json:"dirty_ac"`
	Note        string   `json:"note"`
	Enabled     bool     `json:"enabled"`
	Hidden      bool     `json:"hidden"`
	Max         int      `json:"max"`
	CurrentMax  int      `json:"current_max"`
	Level       int      `json:"level"`
	Player      bool     `json:"player"`
	Status      []string `json:"status"`
	Initiative  int      `json:"initiative"`
	ManualOrder int      `json:"manualOrder"`
	Display     string   `json:"display"`
	Friendly    bool     `json:"friendly"`
	CR          int      `json:"cr"`
	Number      int      `json:"number"`
	Id          string   `json:"id"`
}

type EncounterState struct {
	Id    string                       `json:"id"`
	Order []InitiativeTrackerCombatant `json:"order"`
}

type CombatantChanges struct {
	Combatant InitiativeTrackerCombatant `json:"combatant"`
	Changes   []CombatantChange          `json:"changes"`
}

type CombatantChange struct {
	Property string `json:"property"`
	OldValue any    `json:"oldValue"`
	NewValue any    `json:"newValue"`
}

type ExternalEncounterState struct {
	Id uuid.UUID `json:"id"`
}

// WebhookEvent represents the type for different webhook events.
type WebhookEvent string

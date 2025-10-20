package requests

import "github.com/google/uuid"

type InitaitveTrackerUpdateRequest struct {
	EventType      WebhookEvent                 `json:"eventType"`
	Step           int32                        `json:"step"`
	Combatants     []InitiativeTrackerCombatant `json:"order"`
	EncounterState EncounterState               `json:"encounter"`
	Changes        []CombatantChanges           `json:"changes"`
}

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

type CombatantChanges struct {
	Combatant InitiativeTrackerCombatant `json:"combatant"`
	Changes   []CombatantChange          `json:"changes"`
}

type CombatantChange struct {
	Property string `json:"property"`
	OldValue any    `json:"oldValue"`
	NewValue any    `json:"newValue"`
}

type EncounterState struct {
	Id uuid.UUID `json:"id"`
}

// WebhookEvent represents the type for different webhook events.
type WebhookEvent string

// Define constants for each webhook event.
const (
	NewEncounter       WebhookEvent = "new-encounter"
	Update             WebhookEvent = "update"
	Next               WebhookEvent = "next"
	Previous           WebhookEvent = "previous" // Note: Corrected spelling from 'privious'
	EncounterStart     WebhookEvent = "start-encounter"
	ActiveChanged      WebhookEvent = "active-changed"
	HPChanged          WebhookEvent = "hp-changed"
	TempHPChanged      WebhookEvent = "temp-hp-changed"
	ACChanged          WebhookEvent = "ac-changed"
	EnabledChanged     WebhookEvent = "enabled-changed"
	HiddenChanged      WebhookEvent = "hidden-changed"
	MaxHPChanged       WebhookEvent = "max-hp-changed"
	StatusChanged      WebhookEvent = "status-changed"
	InitiativeChanged  WebhookEvent = "initiative-changed"
	ManualOrderChanged WebhookEvent = "manual-order-changed"
	DisplayChanged     WebhookEvent = "display-changed"
	FriendlyChanged    WebhookEvent = "friendly-changed"
	CreatureAdded      WebhookEvent = "creature-added"
	CreatureRemoved    WebhookEvent = "creature-removed"
)

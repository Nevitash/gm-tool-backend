package constants

import "gm-tool-backend/internal/models"

const (
	NewEncounter       models.WebhookEvent = "new-encounter"
	Update             models.WebhookEvent = "update"
	Next               models.WebhookEvent = "next"
	Previous           models.WebhookEvent = "previous" // Note: Corrected spelling from 'privious'
	EncounterStart     models.WebhookEvent = "start-encounter"
	ActiveChanged      models.WebhookEvent = "active-changed"
	HPChanged          models.WebhookEvent = "hp-changed"
	TempHPChanged      models.WebhookEvent = "temp-hp-changed"
	ACChanged          models.WebhookEvent = "ac-changed"
	EnabledChanged     models.WebhookEvent = "enabled-changed"
	HiddenChanged      models.WebhookEvent = "hidden-changed"
	MaxHPChanged       models.WebhookEvent = "max-hp-changed"
	StatusChanged      models.WebhookEvent = "status-changed"
	InitiativeChanged  models.WebhookEvent = "initiative-changed"
	ManualOrderChanged models.WebhookEvent = "manual-order-changed"
	DisplayChanged     models.WebhookEvent = "display-changed"
	FriendlyChanged    models.WebhookEvent = "friendly-changed"
	CreatureAdded      models.WebhookEvent = "creature-added"
	CreatureRemoved    models.WebhookEvent = "creature-removed"
)

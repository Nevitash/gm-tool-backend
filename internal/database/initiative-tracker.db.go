package database

import (
	"context"
	"gm-tool-backend/ent"
	"gm-tool-backend/ent/encounter"
	appErrors "gm-tool-backend/internal/errors"
	"gm-tool-backend/internal/models"

	"github.com/google/uuid"
)

func UpsertEncounter(gameId uuid.UUID, externalId string, order []models.InitiativeTrackerCombatant) (*ent.Encounter, error) {
	dbClient, err := GetClient()
	if err != nil {
		return nil, err
	}
	id, err := dbClient.Encounter.Create().
		SetGameID(gameId).
		SetExternalID(externalId).
		SetState(&models.EncounterState{Order: order}).
		OnConflictColumns(encounter.FieldGameID, encounter.FieldExternalID).UpdateState().
		ID(context.Background())
	if err != nil {
		return nil, err
	}
	encounter, err := dbClient.Encounter.Query().Where(encounter.ID(id)).Only(context.Background())
	if err != nil {
		return nil, err
	}
	return encounter, nil
}

func GetEncounterWithExternalId(gameId uuid.UUID, externalId string) (*ent.Encounter, error) {
	client, err := GetClient()
	if err != nil {
		return nil, err
	}
	encounter, err := client.Encounter.Query().
		Where(
			encounter.And(
				encounter.ID(gameId),
				encounter.ExternalID(externalId),
			),
		).
		Only(context.Background())
	if err != nil {
		return nil, &appErrors.NoEncounterFoundForExternalId{GameId: gameId, ExternalId: externalId, Wrap: err}
	}
	return encounter, nil
}

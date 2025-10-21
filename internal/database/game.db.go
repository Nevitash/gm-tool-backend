package database

import (
	"context"
	"gm-tool-backend/ent"
	appErrors "gm-tool-backend/internal/errors"
	"gm-tool-backend/internal/requests"

	"github.com/google/uuid"
)

func GetGameWithId(gameId uuid.UUID) (*ent.Game, error) {
	dbClient, err := GetClient()
	if err != nil {
		return nil, err
	}
	game, err := dbClient.Game.Get(context.Background(), gameId)
	if err != nil {
		return nil, &appErrors.NoGameFound{GameId: gameId, Wrap: err}
	}
	return game, nil
}

func CreateGame(request requests.GameCreationRequest, userUuid uuid.UUID) (*ent.Game, error) {
	dbClient, err := GetClient()
	if err != nil {
		return nil, err
	}
	if !DoesUserIdExist(userUuid) {
		return nil, &appErrors.UserDoesNotExist{Id: userUuid, Wrap: nil}
	}
	game, err := dbClient.Game.Create().SetName(request.Name).SetOwnerID(userUuid).Save(context.Background())
	if err != nil {
		return nil, err
	}
	return game, nil
}

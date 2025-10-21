package database

import (
	"context"
	"gm-tool-backend/ent/user"

	"github.com/google/uuid"
)

func DoesUserIdExist(userId uuid.UUID) bool {
	dbClient, err := GetClient()
	if err != nil {
		return false
	}
	exists, err := dbClient.User.Query().Where(user.ID(userId)).Exist(context.Background())
	if err != nil {
		return false
	}
	return exists
}

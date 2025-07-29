package database

import (
	"context"
	"errors"
	"fmt"
	"log"

	"gm-tool-backend/ent"

	_ "github.com/lib/pq"
)

var globalClient *ent.Client

func Init(host string, port int, database string, user string, password string) (*ent.Client, error) {
	dsn := fmt.Sprintf("host=%s port=%d user=%s dbname=%s password=%s sslmode=disable",
		host, port, user, database, password)
	client, err := ent.Open("postgres", dsn)
	if err != nil {
		return nil, fmt.Errorf("failed opening connection to postgres: %w", err)
	}
	globalClient = client
	return globalClient, nil
}

// CreateSchema creates a new Ent client with SQLite database
func CreateSchema() error {
	client, err := GetClient()
	if err != nil {
		return err
	}
	// Run the auto migration tool.
	if err := client.Schema.Create(context.Background()); err != nil {
		return fmt.Errorf("failed creating schema resources: %w", err)
	}
	return nil
}

func GetClient() (*ent.Client, error) {
	if globalClient == nil {
		log.Print("o client was initialized. call .init() first")
		return nil, errors.New("no client was initialized. call .init() first")
	}
	return globalClient, nil
}

func CloseClient() {
	if globalClient != nil {
		globalClient.Close()
	}
}

func InitForTest(dsn string) (*ent.Client, error) {
	client, err := ent.Open("sqlite3", dsn) // Use "sqlite3" driver
	if err != nil {
		return nil, fmt.Errorf("failed opening connection to sqlite for tests: %w", err)
	}
	globalClient = client // Set the global client for tests
	return globalClient, nil
}

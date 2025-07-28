package database

import (
	"context"
	"log"

	"gm-tool-backend/ent"
)

// NewClient creates a new Ent client with SQLite database
func NewClient() (*ent.Client, error) {
	client, err := ent.Open("sqlite3", "file:ent.db?cache=shared&_fk=1")
	if err != nil {
		return nil, err
	}

	// Run the auto migration tool.
	if err := client.Schema.Create(context.Background()); err != nil {
		log.Fatalf("failed creating schema resources: %v", err)
	}

	return client, nil
}

// Close closes the database connection
func Close(client *ent.Client) error {
	return client.Close()
}

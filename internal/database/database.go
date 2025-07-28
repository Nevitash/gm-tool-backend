package database

import (
	"context"
	"fmt"
	"log"

	"gm-tool-backend/ent"

	_ "github.com/lib/pq"
)

// MigrateSchema creates a new Ent client with SQLite database
func MigrateSchema(host string, port int, database string, user string, password string) {
	dsn := fmt.Sprintf("host=%s port=%d user=%s dbname=%s password=%s sslmode=disable",
		host, port, user, database, password)
	client, err := ent.Open("postgres", dsn)
	if err != nil {
		log.Fatalf("failed opening connection to postgres: %v", err)
	}

	// Run the auto migration tool.
	if err := client.Schema.Create(context.Background()); err != nil {
		log.Fatalf("failed creating schema resources: %v", err)
	}
}

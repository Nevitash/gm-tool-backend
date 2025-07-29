package tests

import (
	"context"
	"fmt"
	"gm-tool-backend/internal/database"
	"os"
	"testing"
)

func TestMain(m *testing.M) {
	// Initialize an in-memory SQLite client for testing
	// The DSN for in-memory SQLite
	sqliteDSN := "file:enttest?mode=memory&cache=shared&_fk_checks=0" // _fk_checks=0 is useful for tests

	// Call your new database.InitForTest
	_, err := database.InitForTest(sqliteDSN)
	if err != nil {
		fmt.Printf("Failed to initialize test database: %v\n", err)
		os.Exit(1) // Exit if test setup fails
	}

	// Create the schema for the in-memory database
	if err := database.CreateSchema(); err != nil {
		fmt.Printf("Failed to create schema for test database: %v\n", err)
		os.Exit(1)
	}

	// Ensure client is closed after all tests
	defer database.CloseClient()

	// Run all tests
	code := m.Run()

	os.Exit(code)
}

func clearUsers(t *testing.T) {
	client, err := database.GetClient()
	if err != nil {
		t.Fatalf("Failed to get client for cleanup: %v", err)
	}
	_, err = client.User.Delete().Exec(context.Background())
	if err != nil {
		t.Fatalf("Failed to clean up users: %v", err)
	}
}

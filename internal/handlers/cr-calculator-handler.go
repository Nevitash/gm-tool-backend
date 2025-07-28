package handlers

import (
	"encoding/json"
	"net/http"

	"gm-tool-backend/internal/models"
)

// Placeholder for CR calculator functionality
func GetItems(w http.ResponseWriter, r *http.Request) {
	// Sample items for testing
	items := []models.Item{
		{ID: "1", Name: "Sample Item", Price: 10.0},
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(items)
}

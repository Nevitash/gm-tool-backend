package requests

import "gm-tool-backend/internal/models"

type CalculateEncounterCRsRequest struct {
	PartySize  int              `json:"partySize"`
	PartyLevel int              `json:"partyLevel"`
	Difficulty int              `json:"difficulty"`
	Monsters   []models.Monster `json:"monsters"`
}

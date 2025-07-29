package requests

import "gm-tool-backend/internal/config"

type CalculateEncounterCRsRequest struct {
	PartySize  int               `json:"partySize"`
	PartyLevel int               `json:"partyLevel"`
	Difficulty config.Difficulty `json:"difficulty"`
	Monsters   []Monster         `json:"monsters"`
}

type RecommendedStatsRequest struct {
	Cr string `query:"cr"`
}

type RecommendedSpellSlotsRequest struct {
	Cr string `query:"cr"`
}

type Monster struct {
	CRAdjustment int    `json:"adjustment"`
	ActualCR     string `json:"cr"`
	XP           int    `json:"xp"`
}

package models

type Monster struct {
	CRAdjustment int    `json:"adjustment"`
	ActualCR     string `json:"cr"`
	XP           int    `json:"xp"`
}

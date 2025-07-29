package models

import "github.com/google/uuid"

type Encounter struct {
	ID    uuid.UUID   `json:"id"`
	Party []Combatant `json:"party"`
}

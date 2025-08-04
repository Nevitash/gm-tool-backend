package schema

import (
	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
)

// EncounterDifficultyThreshold holds the schema definition for the EncounterDifficultyThreshold entity.
type EncounterDifficultyThreshold struct {
	ent.Schema
}

// Fields of the EncounterDifficultyThreshold.
func (EncounterDifficultyThreshold) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).Default(uuid.New).Unique(),
		field.Int("player_level").NonNegative(),
		field.Int64("exp").NonNegative(),
	}
}

// Edges of the EncounterDifficultyThreshold.
func (EncounterDifficultyThreshold) Edges() []ent.Edge {
	return []ent.Edge{
		edge.From("difficulty", Difficulty.Type).Ref("thresholds").Unique(),
	}
}

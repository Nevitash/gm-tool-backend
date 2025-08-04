package schema

import (
	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
)

// Difficulty holds the schema definition for the Difficulty entity.
type Difficulty struct {
	ent.Schema
}

// Fields of the Difficulty.
func (Difficulty) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).Default(uuid.New).Unique(),
		field.String("name").MaxLen(30).Unique(),
	}
}

// Edges of the Difficulty.
func (Difficulty) Edges() []ent.Edge {
	return []ent.Edge{
		edge.To("thresholds", EncounterDifficultyThreshold.Type),
	}
}

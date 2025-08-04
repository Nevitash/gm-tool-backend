package schema

import (
	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
)

// CrStat holds the schema definition for the CrStat entity.
type CrStat struct {
	ent.Schema
}

// Fields of the CrStat.
func (CrStat) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).Default(uuid.New).Unique(),
		field.Int("ac").NonNegative(),
		field.Int("hp").NonNegative(),
		field.Int("attackModifier"),
		field.Int("avarageDamage").NonNegative(),
		field.Int("dc").NonNegative(),
	}
}

// Edges of the CrStat.
func (CrStat) Edges() []ent.Edge {
	return []ent.Edge{
		edge.From("cr", ChallangeRating.Type).Ref("stats").Unique(),
	}
}

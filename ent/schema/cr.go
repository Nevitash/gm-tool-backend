package schema

import (
	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
)

// ChallangeRating holds the schema definition for the ChallangeRating entity.
type ChallangeRating struct {
	ent.Schema
}

// Fields of the Cr.
func (ChallangeRating) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).Default(uuid.New).Unique(),
		field.String("cr").Unique().MaxLen(4).NotEmpty(),
	}
}

// Edges of the Cr.
func (ChallangeRating) Edges() []ent.Edge {
	return []ent.Edge{
		edge.To("spell_slots", CrSpellSlot.Type),
		edge.To("stats", CrStat.Type).Unique(),
	}
}

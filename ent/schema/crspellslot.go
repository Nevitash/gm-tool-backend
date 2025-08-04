package schema

import (
	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"entgo.io/ent/schema/index"
	"github.com/google/uuid"
)

// CrSpellSlot holds the schema definition for the CrSpellSlot entity.
type CrSpellSlot struct {
	ent.Schema
}

// Fields of the CrSpellSlot.
func (CrSpellSlot) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).Default(uuid.New).Unique(),
		field.Int("level").Immutable().NonNegative(),
		field.Int("amount").NonNegative(),
	}
}

// Edges of the CrSpellSlot.
func (CrSpellSlot) Edges() []ent.Edge {
	return []ent.Edge{
		edge.From("cr", ChallangeRating.Type).
			Ref("spell_slots").
			Unique(),
	}
}

func (CrSpellSlot) Indexes() []ent.Index {
	return []ent.Index{
		index.Fields("level").Edges("cr").Unique(),
	}
}

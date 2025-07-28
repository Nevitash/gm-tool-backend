package schema

import (
	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
)

// Encounter holds the schema definition for the Encounter entity.
type Encounter struct {
	ent.Schema
}

// Fields of the Encounter.
func (Encounter) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).
			Default(uuid.New).
			StorageKey("id"),
		field.String("name").
			NotEmpty(),
		field.UUID("user_id", uuid.UUID{}).
			Comment("ID of the user who owns this encounter"),
	}
}

// Edges of the Encounter.
func (Encounter) Edges() []ent.Edge {
	return []ent.Edge{
		edge.To("encounter_combatants", EncounterCombatant.Type),
	}
}

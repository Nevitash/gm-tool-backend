package schema

import (
	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
)

// EncounterCombatant holds the schema definition for the EncounterCombatant entity.
type EncounterCombatant struct {
	ent.Schema
}

// Fields of the EncounterCombatant.
func (EncounterCombatant) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).
			Default(uuid.New).
			StorageKey("id"),
		field.UUID("encounter_id", uuid.UUID{}).
			Comment("Reference to the encounter"),
		field.UUID("combatant_id", uuid.UUID{}).
			Comment("Reference to the combatant"),
		field.Bool("is_party_member").
			Default(false).
			Comment("Whether this combatant is a party member"),
		field.Bool("is_friendly").
			Default(false).
			Comment("Whether this combatant is friendly"),
		field.Bool("is_enemy").
			Default(true).
			Comment("Whether this combatant is an enemy"),
	}
}

// Edges of the EncounterCombatant.
func (EncounterCombatant) Edges() []ent.Edge {
	return []ent.Edge{
		edge.From("encounter", Encounter.Type).
			Ref("encounter_combatants").
			Field("encounter_id").
			Unique().
			Required(),
		edge.From("combatant", Combatant.Type).
			Ref("encounter_combatants").
			Field("combatant_id").
			Unique().
			Required(),
	}
}

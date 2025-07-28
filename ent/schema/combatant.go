package schema

import (
	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
)

// Combatant holds the schema definition for the Combatant entity.
type Combatant struct {
	ent.Schema
}

// Fields of the Combatant.
func (Combatant) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).
			Default(uuid.New).
			StorageKey("id"),
		field.String("name").
			NotEmpty(),
		field.Float("cr").
			Comment("Challenge Rating, e.g., 1.25"),
		field.Int("ac").
			Comment("Armor Class"),
		field.Int("hp").
			Comment("Hit Points"),
		field.String("hit_dice").
			Comment("Hit dice as string, e.g., '2d8+2'"),
		field.Int("speed_mod").
			Comment("Speed modifier, can be negative"),
		field.Int("dc").
			Comment("Difficulty Class"),
		field.Float("damage").
			Comment("Damage as decimal, e.g., 45.6"),
		field.Bool("is_boss").
			Default(false).
			Comment("Whether this combatant is a boss"),
		field.Bool("is_legendary").
			Default(false).
			Comment("Whether this combatant is legendary"),
	}
}

// Edges of the Combatant.
func (Combatant) Edges() []ent.Edge {
	return []ent.Edge{
		edge.To("encounter_combatants", EncounterCombatant.Type),
	}
}

package schema

import (
	"gm-tool-backend/internal/models"

	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"entgo.io/ent/schema/index"
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
			Optional(),
		field.UUID("game_id", uuid.UUID{}),
		field.String("external_id"),
		field.JSON("state", &models.EncounterState{}).
			Optional(),
	}
}

// Edges of the Encounter.
func (Encounter) Edges() []ent.Edge {
	return []ent.Edge{
		edge.From("game", Game.Type).Ref("encounters").
			Field("game_id").
			Unique().
			Required(),
		edge.To("encounter_combatants", EncounterCombatant.Type),
	}
}

func (Encounter) Indexes() []ent.Index {
	return []ent.Index{
		index.Fields("game_id", "external_id").Unique(),
	}
}

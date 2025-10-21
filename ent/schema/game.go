package schema

import (
	"entgo.io/ent"
	"entgo.io/ent/schema/edge"
	"entgo.io/ent/schema/field"
	"entgo.io/ent/schema/index"
	"github.com/google/uuid"
)

// Game holds the schema definition for the Game entity.
type Game struct {
	ent.Schema
}

// Fields of the Game.
func (Game) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).
			Default(uuid.New).
			StorageKey("id"),
		field.String("name").
			NotEmpty(),
		field.UUID("owner_id", uuid.UUID{}).
			Comment("ID of the user who owns this game"),
	}
}

// Edges of the Game.
func (Game) Edges() []ent.Edge {
	return []ent.Edge{
		edge.From("user", User.Type).Ref("games").
			Field("owner_id").
			Unique().
			Required(),
		edge.To("players", User.Type),
		edge.To("encounters", Encounter.Type),
	}
}

func (Game) Indexes() []ent.Index {
	return []ent.Index{
		index.Fields("owner_id", "name").Unique(),
	}
}

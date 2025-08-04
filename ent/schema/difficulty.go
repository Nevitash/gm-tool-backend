package schema

import "entgo.io/ent"

// Difficulty holds the schema definition for the Difficulty entity.
type Difficulty struct {
	ent.Schema
}

// Fields of the Difficulty.
func (Difficulty) Fields() []ent.Field {
	return nil
}

// Edges of the Difficulty.
func (Difficulty) Edges() []ent.Edge {
	return nil
}

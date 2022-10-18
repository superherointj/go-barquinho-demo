package schema

import (
	"entgo.io/contrib/entproto"
	"entgo.io/ent"
	"entgo.io/ent/schema"
	"entgo.io/ent/schema/field"
)

// Player holds the schema definition for the Player entity.
type Player struct {
	ent.Schema
}

// Fields of the Player.
func (Player) Fields() []ent.Field {
	return []ent.Field{
		field.String("username").Unique().
			Annotations(
				entproto.Field(2),
			),
	}
}

func (Player) Edges() []ent.Edge {
	return nil
}

func (Player) Annotations() []schema.Annotation {
	return []schema.Annotation{
		entproto.Message(),
		entproto.Service(),
	}
}

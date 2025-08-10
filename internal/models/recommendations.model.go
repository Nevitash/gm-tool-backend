package models

type RecommendedStats struct {
	Cr             string `json:"cr"`
	Ac             int    `json:"ac"`
	Hp             int    `json:"hp"`
	AttackModifier int    `json:"attackModifier"`
	AvarageDamage  int    `json:"avarageDamage"`
	Dc             int    `json:"dc"`
}

type SpellSlotLevel struct {
	Level  int `json:"level"`
	Amount int `json:"amount"`
}

type RecommendedSpellSlots struct {
	Cr         string           `json:"cr"`
	SpellSlots []SpellSlotLevel `json:"spellSlots"`
}

func NewRecommendedStats(cr string, ac int, hp int, attackMofidier int, avarageDamage int, dc int) RecommendedStats {
	if ac < 0 {
		ac = 10
	}

	return RecommendedStats{
		Cr:             cr,
		Ac:             ac,
		Hp:             hp,
		AvarageDamage:  avarageDamage,
		AttackModifier: attackMofidier,
		Dc:             dc,
	}
}

func NewSpellSlotLevel(level int, amount int) SpellSlotLevel {
	return SpellSlotLevel{
		Level:  level,
		Amount: amount,
	}
}

func NewRecommendedSpellSlots(cr string, spellSlots []SpellSlotLevel) RecommendedSpellSlots {
	return RecommendedSpellSlots{
		Cr:         cr,
		SpellSlots: spellSlots,
	}
}

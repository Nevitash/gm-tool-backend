package responses

type RecommendedStatsResponse struct {
	Cr             string `json:"cr"`
	Ac             int    `json:"ac"`
	Hp             int    `json:"hp"`
	AttackModifier int    `json:"attackModifier"`
	AvarageDamage  int    `json:"avarageDamage"`
	Dc             int    `json:"dc"`
}

func NewRecommendedStatsResponse(cr string, ac int, hp int, attackModifier int, avarageDamage int, dc int) *RecommendedStatsResponse {
	return &RecommendedStatsResponse{
		Cr:             cr,
		Ac:             ac,
		Hp:             hp,
		AttackModifier: attackModifier,
		AvarageDamage:  avarageDamage,
		Dc:             dc,
	}
}

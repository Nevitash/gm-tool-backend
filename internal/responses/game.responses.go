package responses

type GameResponse struct {
	ID   string `json:"id"`
	Name string `json:"name"`
}

func NewGameResponse(id string, name string) *GameResponse {
	return &GameResponse{
		ID:   id,
		Name: name,
	}
}

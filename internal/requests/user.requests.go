package requests

type UserCreationRequest struct {
	Name  string `json:"name"`
	Email string `json:"email"`
}

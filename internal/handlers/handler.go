package handlers

import (
    "encoding/json"
    "net/http"
)

type Item struct {
    ID   string `json:"id"`
    Name string `json:"name"`
}

var items []Item

func GetItems(w http.ResponseWriter, r *http.Request) {
    w.Header().Set("Content-Type", "application/json")
    json.NewEncoder(w).Encode(items)
}

func CreateItem(w http.ResponseWriter, r *http.Request) {
    var newItem Item
    if err := json.NewDecoder(r.Body).Decode(&newItem); err != nil {
        http.Error(w, err.Error(), http.StatusBadRequest)
        return
    }
    items = append(items, newItem)
    w.WriteHeader(http.StatusCreated)
    json.NewEncoder(w).Encode(newItem)
}
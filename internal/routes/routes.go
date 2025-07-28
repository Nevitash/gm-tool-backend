package routes

import (
    "github.com/gin-gonic/gin"
    "go-rest-api-backend/internal/handlers"
)

func SetupRoutes(router *gin.Engine) {
    router.GET("/items", handlers.GetItems)
    router.POST("/items", handlers.CreateItem)
}
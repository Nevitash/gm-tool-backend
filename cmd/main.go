package main

import (
	"log"
	"net/http"

	"gm-tool-backend/internal/config"
	"gm-tool-backend/internal/database"
	"gm-tool-backend/internal/routes"

	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

func main() {
	// Initialize database
	dbConfig := config.NewDatabaseConfig()
	database.MigrateSchema(
		dbConfig.GetHost(),
		dbConfig.GetPort(),
		dbConfig.GetDatabaseName(),
		dbConfig.GetUser(),
		dbConfig.GetPassword(),
	)
	// Initialize Echo
	e := echo.New()

	// Middleware
	e.Use(middleware.Logger())
	e.Use(middleware.Recover())
	e.Use(middleware.CORS())

	// Routes
	e.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, "GM Tool Backend API")
	})

	// Setup API routes
	routes.SetupRoutes(e)

	// Start server
	log.Println("Starting server on :8080")
	e.Logger.Fatal(e.Start(":8080"))
}

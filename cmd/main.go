// Package main GM Tool Backend API
//
// This is the GM Tool Backend API server for D&D 5e encounter management and CR calculation.
//
// Terms Of Service: http://swagger.io/terms/
//
// Schemes: http, https
// Host: localhost:8080
// BasePath: /
// Version: 1.0.0
// License: MIT http://opensource.org/licenses/MIT
// Contact: GM Tool Support <support@gmtool.com> http://www.gmtool.com
//
// Consumes:
// - application/json
//
// Produces:
// - application/json
//
// swagger:meta
package main

import (
	"fmt"
	"log"
	"net/http"

	"gm-tool-backend/internal/config"
	"gm-tool-backend/internal/database"
	"gm-tool-backend/internal/routes"

	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
	echoSwagger "github.com/swaggo/echo-swagger"

	_ "gm-tool-backend/docs" // This line is necessary for go-swagger to find your docs!
)

func main() {
	// Initialize database
	if err := InitDatabase(config.NewDatabaseConfig()); err != nil {
		log.Fatal(err)
	}
	defer database.CloseClient()

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

	// Swagger endpoint
	e.GET("/swagger/*", echoSwagger.WrapHandler)

	// Setup API routes
	routes.SetupRoutes(e)

	// Start server
	log.Println("Starting server on :8080")
	e.Logger.Fatal(e.Start(":8080"))
}

func InitDatabase(config *config.DatabaseConfig) error {
	_, err := database.Init(
		config.GetHost(),
		config.GetPort(),
		config.GetDatabaseName(),
		config.GetUser(),
		config.GetPassword(),
	)
	if err != nil {
		return fmt.Errorf("Error during database initilazion: %w", err)
	}
	if err := database.CreateSchema(); err != nil {
		return fmt.Errorf("Error during schema creation: %w", err)
	}
	return nil
}

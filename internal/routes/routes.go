package routes

import (
	"gm-tool-backend/internal/handlers"

	"github.com/labstack/echo/v4"
)

func SetupRoutes(echoInstance *echo.Echo) {
	setupUserRoutes(echoInstance)
	setupCrCalculatorRoutes(echoInstance)
	// Encounter routes
	// echoInstance.GET("/encounters", handlers.GetEncounters(client))
	// echoInstance.POST("/encounters", handlers.CreateEncounter(client))
	// echoInstance.GET("/encounters/:id", handlers.GetEncounter(client))
	// echoInstance.PUT("/encounters/:id", handlers.UpdateEncounter(client))
	// echoInstance.DELETE("/encounters/:id", handlers.DeleteEncounter(client))

	// // Combatant routes
	// echoInstance.GET("/combatants", handlers.GetCombatants(client))
	// echoInstance.POST("/combatants", handlers.CreateCombatant(client))
	// echoInstance.GET("/combatants/:id", handlers.GetCombatant(client))
	// echoInstance.PUT("/combatants/:id", handlers.UpdateCombatant(client))
	// echoInstance.DELETE("/combatants/:id", handlers.DeleteCombatant(client))

	// // Encounter-Combatant relationship routes
	// echoInstance.POST("/encounters/:id/combatants", handlers.AddCombatantToEncounter(client))
	// echoInstance.DELETE("/encounters/:encounter_id/combatants/:combatant_id", handlers.RemoveCombatantFromEncounter(client))
	// echoInstance.GET("/encounters/:id/combatants", handlers.GetEncounterCombatants(client))
}

func setupUserRoutes(echoInstance *echo.Echo) {
	echoInstance.POST("/user", handlers.PostUser)
}

func setupCrCalculatorRoutes(echoInstance *echo.Echo) {
	echoInstance.POST("/encounter-calculator", handlers.CalculateMonsterCrForEncounter)
}

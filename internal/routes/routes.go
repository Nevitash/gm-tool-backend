package routes

import (
	"gm-tool-backend/internal/handlers"

	"github.com/labstack/echo/v4"
)

func SetupRoutes(echoInstance *echo.Echo) {
	setupUserRoutes(echoInstance)
	setupCrCalculatorRoutes(echoInstance)
	setupInititiaveTrackerRoutes(echoInstance)
	setupGameRoutes(echoInstance)
	setupEncounterRoutes(echoInstance)
}

func setupInititiaveTrackerRoutes(echoInstance *echo.Echo) {
	echoInstance.POST("/inititative-tracker/:gameId", handlers.InitiativeTrackerPost)
}

func setupUserRoutes(echoInstance *echo.Echo) {
	echoInstance.POST("/user", handlers.PostUser)
}

func setupEncounterRoutes(echoInstance *echo.Echo) {
	echoInstance.POST("/:gameId/encounter", handlers.PostEncounter)
}

func setupGameRoutes(echoInstance *echo.Echo) {
	echoInstance.POST("/:userId/game", handlers.PostGame)
}

func setupCrCalculatorRoutes(echoInstance *echo.Echo) {
	echoInstance.POST("/encounter-calculator", handlers.CalculateMonsterCrForEncounter)
	echoInstance.GET("/encounter-calculator/recommend/stats", handlers.GetRecommandedStats)
	echoInstance.GET("/encounter-calculator/recommend/spell-slots", handlers.GetRecoommendedSpellSlots)
}

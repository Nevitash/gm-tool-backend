package handlers

import (
	"fmt"
	"math"
	"net/http"
	"sort"

	"gm-tool-backend/internal/config"
	"gm-tool-backend/internal/data"
	"gm-tool-backend/internal/requests"

	"github.com/labstack/echo/v4"
)

// @Summary Get recommended stats for an enemy of the given CR
// @Tags encounter-calculator
// @Accept json
// @Produce json
// @Param encounter query requests.RecommendedStatsRequest true "CR for which the recommended stats should be loaded"
// @Success 200 {array} responses.RecommendedStatsResponse "Calculated stats for the given CR"
// @Failure 400 {string} string "Bad request - invalid request format or calculation error"
// @Router /encounter-calculator/recommend/stats [get]
func GetRecommandedStats(c echo.Context) error {
	request := &requests.RecommendedStatsRequest{}
	err := c.Bind(request)
	if err != nil {
		return fmt.Errorf("invalid request format: %w", err)
	}
	recommendedStats, err := data.GetRecommendedStatsForCr(request.Cr)
	if err != nil {
		return fmt.Errorf("no recommended stats for cr '%v'", request.Cr)
	}
	return c.JSON(http.StatusOK, recommendedStats)
}

// @Summary Get recommended spell slots for an enemy of the given CR
// @Tags encounter-calculator
// @Accept json
// @Produce json
// @Param encounter query requests.RecommendedSpellSlotsRequest true "CR for which the recommended spell slots should be loaded"
// @Success 200 {array} responses.SpellSlotsPerCrResponse "Calculated spell slots for the given CR"
// @Failure 400 {string} string "Bad request - invalid request format or calculation error"
// @Router /encounter-calculator/recommend/spell-slots [get]
func GetRecoommendedSpellSlots(c echo.Context) error {
	request := &requests.RecommendedSpellSlotsRequest{}
	err := c.Bind(request)
	if err != nil {
		return fmt.Errorf("invalid request format: %w", err)
	}
	recommendedSpellSlots, err := data.GetRecommendedSpellSlotsForCr(request.Cr)
	if err != nil {
		return fmt.Errorf("no recommended spell slots for cr '%v'", request.Cr)
	}
	return c.JSON(http.StatusOK, recommendedSpellSlots)
}

// CalculateMonsterCrForEncounter calculates monster CR for an encounter
// @Summary Calculate monster CR for encounter
// @Description Calculate the appropriate Challenge Rating for monsters in a D&D 5e encounter based on party size, level, and difficulty
// @Tags encounter-calculator
// @Accept json
// @Produce json
// @Param encounter body requests.CalculateEncounterCRsRequest true "Encounter CR calculation request"
// @Success 200 {array} requests.Monster "Calculated monster CRs and XP values"
// @Failure 400 {string} string "Bad request - invalid request format or calculation error"
// @Router /encounter-calculator [post]
func CalculateMonsterCrForEncounter(c echo.Context) error {
	request := &requests.CalculateEncounterCRsRequest{}
	err := c.Bind(request)
	if err != nil {
		return fmt.Errorf("invalid request format: %w", err)
	}

	result, err := CalculateEncounterCRs(request.PartySize, request.PartyLevel, request.Difficulty, request.Monsters)
	if err != nil {
		return fmt.Errorf("error occurred during calculation: %w", err)
	}
	return c.JSON(http.StatusOK, result)
}

// CR to XP mapping (This remains the same as it's standard D&D 5e)

// 2024 D&D XP Thresholds per character (approximated from various 2024 DMG previews/discussions)
// These values are the *per character* XP minimums for each difficulty.
// Note: Official 2024 DMG might have slight variations, but these are commonly accepted interpretations.

// EncounterParams holds the encounter parameters
type EncounterParams struct {
	PartySize  int
	PartyLevel int
	Difficulty int // Use the new Difficulty constants
}

// CalculateEncounterCRs calculates the balanced CRs for all monsters based on 2024 D&D rules
func CalculateEncounterCRs(partySize int, partyLevel int, difficulty config.Difficulty, monsters []requests.Monster) ([]requests.Monster, error) {
	if len(monsters) == 0 {
		return nil, fmt.Errorf("must have at least one monster")
	}
	if partySize <= 0 || partyLevel <= 0 {
		return nil, fmt.Errorf("party size and level must be positive")
	}

	targetXPPerCharacter, err := get2024XpThreshold(partyLevel, difficulty)
	if err != nil {
		return nil, err
	}
	targetTotalXP := float64(partySize * targetXPPerCharacter)
	baselineCR := findBalancedBaselineCR(targetTotalXP, monsters)

	result := make([]requests.Monster, len(monsters))
	for i, monster := range monsters {
		actualCR := adjustCR(baselineCR, monster.CRAdjustment)
		if actualCR == "" {
			// This indicates an invalid adjustment leading to an unmappable CR
			// Log this or return a more specific error for the monster in question
			fmt.Printf("Warning: Could not determine actual CR for monster with base CR '%s' and adjustment %d. Skipping this monster.\n", baselineCR, monster.CRAdjustment)
			result[i] = requests.Monster{
				CRAdjustment: monster.CRAdjustment,
				ActualCR:     "N/A", // Indicate an error for this specific monster
				XP:           0,
			}
			continue
		}
		xp, _ := data.GetCrXp(actualCR)
		result[i] = requests.Monster{
			CRAdjustment: monster.CRAdjustment,
			ActualCR:     actualCR,
			XP:           xp,
		}
	}

	return result, nil
}

func findBalancedBaselineCR(targetXP float64, monsters []requests.Monster) string {
	var crOptions, _ = data.GetCrs()

	sort.Slice(crOptions, func(i, j int) bool {
		xp1, _ := data.GetCrXp(crOptions[i])
		xp2, _ := data.GetCrXp(crOptions[j])
		return xp1 < xp2
	})

	bestCR := "0" // Smallest CR by XP
	if len(crOptions) > 0 {
		bestCR = crOptions[0]
	}

	bestDiff := math.Inf(1)

	for _, baseCR := range crOptions {
		totalXP := 0.0
		validEncounter := true

		for _, monster := range monsters {
			adjustedCR := adjustCR(baseCR, monster.CRAdjustment)
			if adjustedCR == "" {
				validEncounter = false
				break
			}
			currentXp, _ := data.GetCrXp(adjustedCR)
			totalXP += float64(currentXp)
		}

		if !validEncounter {
			continue
		}

		diff := math.Abs(totalXP - targetXP)
		if diff < bestDiff {
			bestDiff = diff
			bestCR = baseCR
		}
	}

	return bestCR
}

func adjustCR(baseCR string, adjustment int) string {
	if adjustment == 0 {
		return baseCR
	}

	crList, _ := data.GetCrs()
	sort.Slice(crList, func(i, j int) bool {
		xp1, _ := data.GetCrXp(crList[i])
		xp2, _ := data.GetCrXp(crList[j])
		return xp1 < xp2
	})

	currentIndex := -1
	for i, cr := range crList {
		if cr == baseCR {
			currentIndex = i
			break
		}
	}

	if currentIndex == -1 {
		return ""
	}

	newIndex := currentIndex + adjustment
	if newIndex < 0 || newIndex >= len(crList) {
		return "" // Invalid CR
	}

	result := crList[newIndex]
	return result
}

func get2024XpThreshold(level int, difficulty config.Difficulty) (int, error) {
	threshold, err := data.GetXpThresholdForEncounter(level, string(difficulty))
	if err != nil {
		return 0, fmt.Errorf("XP threshold not defined for difficulty %s at level %d", getDifficultyName(difficulty), level)
	}
	return threshold, nil
}

func NewMonster(crAdjustment int) requests.Monster {
	return requests.Monster{CRAdjustment: crAdjustment}
}

func getDifficultyName(difficulty config.Difficulty) string {
	switch difficulty {
	case config.DIFFICULTY_EASY:
		return "Easy (2024 Low)"
	case config.DIFFICULTY_MEDIUM:
		return "Medium (2024 Moderate)"
	case config.DIFFICULTY_HARD:
		return "Hard (2024 High)"
	case config.DIFFICULTY_DEADLY:
		return "Deadly (2024 Beyond High)"
	default:
		return "Unknown"
	}
}

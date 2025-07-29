package handlers

import (
	"fmt"
	"math"
	"net/http"
	"sort"

	"gm-tool-backend/internal/config"
	"gm-tool-backend/internal/requests"
	"gm-tool-backend/internal/responses"

	"github.com/labstack/echo/v4"
)

// @Summary Get recommended stats for a enemy of the given CR
// @Tags encounter-calculator
// @Accept json
// @Produce json
// @Param encounter query requests.RecommendedStatsRequest true "CR for which the recommended stats should be loaded"
// @Success 200 {array} requests.Monster "Calculated monster CRs and XP values"
// @Failure 400 {string} string "Bad request - invalid request format or calculation error"
// @Router /encounter-calculator/recommend [get]
func GetRecommandedStats(c echo.Context) error {
	request := &requests.RecommendedStatsRequest{}
	err := c.Bind(request)
	if err != nil {
		return fmt.Errorf("invalid request format: %w", err)
	}
	stats, ok := config.RecommendedStatsByCr[request.Cr]
	if !ok {
		return fmt.Errorf("no recommended stats vor cr '%v'", request.Cr)
	}
	response := responses.NewRecommendedStatsResponse(stats.Cr, stats.Ac, stats.Hp, stats.AttackModifier, stats.AvarageDamage, stats.Dc)
	return c.JSON(http.StatusOK, response)
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

	// Step 1: Determine the total target XP budget for the encounter based on 2024 rules
	// The `difficulty` constant now directly maps to a threshold lookup.
	targetXPPerCharacter, err := get2024XpThreshold(partyLevel, difficulty)
	if err != nil {
		return nil, err // Propagate the error from threshold lookup
	}
	targetTotalXP := float64(partySize * targetXPPerCharacter)

	// Step 2 (OLD 2014 rule): Get encounter multiplier - THIS IS REMOVED FOR 2024 RULES!
	// Step 3 (OLD 2014 rule): Calculate adjusted XP budget - THIS IS REMOVED FOR 2024 RULES!
	// In 2024 rules, targetTotalXP *is* the total XP.

	// Step 4: Find the baseline CR that balances the encounter
	// The findBalancedBaselineCR function will now directly aim for targetTotalXP.
	baselineCR := findBalancedBaselineCR(targetTotalXP, monsters)

	// Step 5: Calculate actual CRs and XP for each monster
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
		result[i] = requests.Monster{
			CRAdjustment: monster.CRAdjustment,
			ActualCR:     actualCR,
			XP:           config.ChallangeRatingExp[actualCR],
		}
	}

	return result, nil
}

// findBalancedBaselineCR finds the CR that makes the total encounter XP match the budget
// This function's logic remains largely the same, but it now receives the *final* target XP.
func findBalancedBaselineCR(targetXP float64, monsters []requests.Monster) string {
	var crOptions []string
	for cr := range config.ChallangeRatingExp {
		crOptions = append(crOptions, cr)
	}

	sort.Slice(crOptions, func(i, j int) bool {
		return config.ChallangeRatingExp[crOptions[i]] < config.ChallangeRatingExp[crOptions[j]]
	})

	// Start with a reasonable default, like CR 0 or 1/8 if available.
	// Ensure bestCR is initialized to a valid CR, preferably the lowest one.
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
			totalXP += float64(config.ChallangeRatingExp[adjustedCR])
		}

		if !validEncounter {
			continue
		}

		diff := math.Abs(totalXP - targetXP)
		if diff < bestDiff {
			bestDiff = diff
			bestCR = baseCR
		}

		// Debug output for troubleshooting
		fmt.Printf("DEBUG: Baseline CR %s -> Total XP: %.0f (target: %.0f, diff: %.0f)\n",
			baseCR, totalXP, targetXP, diff)
	}

	return bestCR
}

// adjustCR adjusts a base CR by the specified amount
func adjustCR(baseCR string, adjustment int) string {
	if adjustment == 0 {
		return baseCR
	}

	var crList []string
	for cr := range config.ChallangeRatingExp {
		crList = append(crList, cr)
	}

	sort.Slice(crList, func(i, j int) bool {
		return config.ChallangeRatingExp[crList[i]] < config.ChallangeRatingExp[crList[j]]
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

// get2024XpThreshold returns the per-character XP threshold for a given level and difficulty
// based on the 2024 D&D rules.
func get2024XpThreshold(level int, difficulty config.Difficulty) (int, error) {
	levelThresholds, ok := config.DifficultiyExpThresholds[level]
	if !ok {
		return 0, fmt.Errorf("XP thresholds not defined for party level %d", level)
	}
	threshold, ok := levelThresholds[difficulty]
	if !ok {
		return 0, fmt.Errorf("XP threshold not defined for difficulty %s at level %d", getDifficultyName(difficulty), level)
	}
	return threshold, nil
}

// Helper function to create monsters with adjustments (assuming it's used elsewhere for testing/request generation)
func NewMonster(crAdjustment int) requests.Monster {
	return requests.Monster{CRAdjustment: crAdjustment}
}

// getDifficultyName helps map the new integer constants back to readable names
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

package handlers

import (
	"fmt"
	"math"
	"net/http"
	"sort"

	"gm-tool-backend/internal/models"
	"gm-tool-backend/internal/requests"

	"github.com/labstack/echo/v4"
)

// Placeholder for CR calculator functionality
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

// 2024 D&D Encounter Difficulty Constants (re-mapping your previous ones to represent typical 2024 thresholds)
// These now refer to a 'level' within the new XP threshold system, not raw multipliers.
const (
	DifficultyEasy   = 1 // Represents the 'Low' threshold in 2024 rules
	DifficultyMedium = 2 // Represents the 'Moderate' threshold in 2024 rules
	DifficultyHard   = 3 // Represents the 'High' threshold in 2024 rules
	DifficultyDeadly = 4 // Represents exceeding 'High', or a very tough 'High' encounter
)

// CR to XP mapping (This remains the same as it's standard D&D 5e)
var crToXP = map[string]int{
	"0":   10,
	"1/8": 25,
	"1/4": 50,
	"1/2": 100,
	"1":   200,
	"2":   450,
	"3":   700,
	"4":   1100,
	"5":   1800,
	"6":   2300,
	"7":   2900,
	"8":   3900,
	"9":   5000,
	"10":  5900,
	"11":  7200,
	"12":  8400,
	"13":  10000,
	"14":  11500,
	"15":  13000,
	"16":  15000,
	"17":  18000,
	"18":  20000,
	"19":  22000,
	"20":  25000,
	"21":  33000,
	"22":  41000,
	"23":  50000,
	"24":  62000,
	"25":  75000,
	"26":  90000,
	"27":  105000,
	"28":  120000,
	"29":  135000,
	"30":  155000,
}

// 2024 D&D XP Thresholds per character (approximated from various 2024 DMG previews/discussions)
// These values are the *per character* XP minimums for each difficulty.
// Note: Official 2024 DMG might have slight variations, but these are commonly accepted interpretations.
var xpThresholds2024 = map[int]map[int]int{
	1:  {DifficultyEasy: 25, DifficultyMedium: 50, DifficultyHard: 75, DifficultyDeadly: 100},
	2:  {DifficultyEasy: 50, DifficultyMedium: 100, DifficultyHard: 150, DifficultyDeadly: 200},
	3:  {DifficultyEasy: 75, DifficultyMedium: 150, DifficultyHard: 225, DifficultyDeadly: 400},
	4:  {DifficultyEasy: 125, DifficultyMedium: 250, DifficultyHard: 375, DifficultyDeadly: 500},
	5:  {DifficultyEasy: 250, DifficultyMedium: 500, DifficultyHard: 750, DifficultyDeadly: 1100},
	6:  {DifficultyEasy: 300, DifficultyMedium: 600, DifficultyHard: 900, DifficultyDeadly: 1400},
	7:  {DifficultyEasy: 350, DifficultyMedium: 750, DifficultyHard: 1100, DifficultyDeadly: 1700},
	8:  {DifficultyEasy: 450, DifficultyMedium: 900, DifficultyHard: 1400, DifficultyDeadly: 2100},
	9:  {DifficultyEasy: 550, DifficultyMedium: 1100, DifficultyHard: 1600, DifficultyDeadly: 2400},
	10: {DifficultyEasy: 600, DifficultyMedium: 1200, DifficultyHard: 1900, DifficultyDeadly: 2800},
	11: {DifficultyEasy: 800, DifficultyMedium: 1600, DifficultyHard: 2400, DifficultyDeadly: 3600},
	12: {DifficultyEasy: 1000, DifficultyMedium: 2000, DifficultyHard: 3000, DifficultyDeadly: 4500},
	13: {DifficultyEasy: 1100, DifficultyMedium: 2200, DifficultyHard: 3400, DifficultyDeadly: 5100},
	14: {DifficultyEasy: 1250, DifficultyMedium: 2500, DifficultyHard: 3800, DifficultyDeadly: 5700},
	15: {DifficultyEasy: 1400, DifficultyMedium: 2800, DifficultyHard: 4300, DifficultyDeadly: 6400},
	16: {DifficultyEasy: 1600, DifficultyMedium: 3200, DifficultyHard: 4800, DifficultyDeadly: 7200},
	17: {DifficultyEasy: 2000, DifficultyMedium: 3900, DifficultyHard: 5900, DifficultyDeadly: 8800},
	18: {DifficultyEasy: 2100, DifficultyMedium: 4200, DifficultyHard: 6300, DifficultyDeadly: 9500},
	19: {DifficultyEasy: 2400, DifficultyMedium: 4900, DifficultyHard: 7300, DifficultyDeadly: 10900},
	20: {DifficultyEasy: 2800, DifficultyMedium: 5700, DifficultyHard: 8500, DifficultyDeadly: 12700},
}

// EncounterParams holds the encounter parameters
type EncounterParams struct {
	PartySize  int
	PartyLevel int
	Difficulty int // Use the new Difficulty constants
}

// CalculateEncounterCRs calculates the balanced CRs for all monsters based on 2024 D&D rules
func CalculateEncounterCRs(partySize int, partyLevel int, difficulty int, monsters []models.Monster) ([]models.Monster, error) {
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
	result := make([]models.Monster, len(monsters))
	for i, monster := range monsters {
		actualCR := adjustCR(baselineCR, monster.CRAdjustment)
		if actualCR == "" {
			// This indicates an invalid adjustment leading to an unmappable CR
			// Log this or return a more specific error for the monster in question
			fmt.Printf("Warning: Could not determine actual CR for monster with base CR '%s' and adjustment %d. Skipping this monster.\n", baselineCR, monster.CRAdjustment)
			result[i] = models.Monster{
				CRAdjustment: monster.CRAdjustment,
				ActualCR:     "N/A", // Indicate an error for this specific monster
				XP:           0,
			}
			continue
		}
		result[i] = models.Monster{
			CRAdjustment: monster.CRAdjustment,
			ActualCR:     actualCR,
			XP:           crToXP[actualCR],
		}
	}

	return result, nil
}

// findBalancedBaselineCR finds the CR that makes the total encounter XP match the budget
// This function's logic remains largely the same, but it now receives the *final* target XP.
func findBalancedBaselineCR(targetXP float64, monsters []models.Monster) string {
	var crOptions []string
	for cr := range crToXP {
		crOptions = append(crOptions, cr)
	}

	sort.Slice(crOptions, func(i, j int) bool {
		return crToXP[crOptions[i]] < crToXP[crOptions[j]]
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
			totalXP += float64(crToXP[adjustedCR])
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
	for cr := range crToXP {
		crList = append(crList, cr)
	}

	sort.Slice(crList, func(i, j int) bool {
		return crToXP[crList[i]] < crToXP[crList[j]]
	})

	currentIndex := -1
	for i, cr := range crList {
		if cr == baseCR {
			currentIndex = i
			break
		}
	}

	if currentIndex == -1 {
		fmt.Printf("DEBUG: Could not find base CR '%s' in list\n", baseCR)
		return ""
	}

	newIndex := currentIndex + adjustment
	if newIndex < 0 || newIndex >= len(crList) {
		fmt.Printf("DEBUG: Adjustment out of bounds - base: %s (index %d), adj: %d, new index: %d, max: %d\n",
			baseCR, currentIndex, adjustment, newIndex, len(crList)-1)
		return "" // Invalid CR
	}

	result := crList[newIndex]
	fmt.Printf("DEBUG: CR adjustment - base: %s -> %s (adj: %+d)\n", baseCR, result, adjustment)
	return result
}

// get2024XpThreshold returns the per-character XP threshold for a given level and difficulty
// based on the 2024 D&D rules.
func get2024XpThreshold(level, difficulty int) (int, error) {
	levelThresholds, ok := xpThresholds2024[level]
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
func NewMonster(crAdjustment int) models.Monster {
	return models.Monster{CRAdjustment: crAdjustment}
}

// getDifficultyName helps map the new integer constants back to readable names
func getDifficultyName(difficulty int) string {
	switch difficulty {
	case DifficultyEasy:
		return "Easy (2024 Low)"
	case DifficultyMedium:
		return "Medium (2024 Moderate)"
	case DifficultyHard:
		return "Hard (2024 High)"
	case DifficultyDeadly:
		return "Deadly (2024 Beyond High)"
	default:
		return "Unknown"
	}
}

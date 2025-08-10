package data

import (
	"context"
	"gm-tool-backend/ent"
	"gm-tool-backend/ent/challangerating"
	"gm-tool-backend/ent/difficulty"
	"gm-tool-backend/ent/encounterdifficultythreshold"
	"gm-tool-backend/internal/database"
	appErrors "gm-tool-backend/internal/errors"
	"gm-tool-backend/internal/models"
)

func GetRecommendedDataForCr(cr string) (*ent.ChallangeRating, error) {
	client, err := database.GetClient()
	if err != nil {
		return nil, err
	}
	crModel, err := client.ChallangeRating.Query().WithStats().WithSpellSlots().Where(challangerating.Cr(cr)).First(context.Background())
	if err != nil {
		return nil, err
	}
	return crModel, nil
}

func GetRecommendedStatsForCr(cr string) (*models.RecommendedStats, error) {
	client, err := database.GetClient()
	if err != nil {
		return nil, err
	}
	crModel, err := client.ChallangeRating.Query().WithStats().Where(challangerating.Cr(cr)).First(context.Background())
	if err != nil {
		return nil, err
	}
	stats, err := mapCrToStats(crModel)
	if err != nil {
		return nil, err
	}
	return stats, nil
}

func GetRecommendedSpellSlotsForCr(cr string) (*models.RecommendedSpellSlots, error) {
	client, err := database.GetClient()
	if err != nil {
		return nil, err
	}
	crModel, err := client.ChallangeRating.Query().WithSpellSlots().Where(challangerating.Cr(cr)).First(context.Background())
	if err != nil {
		return nil, err
	}
	spellSlots, err := mapCrToSpellSlots(crModel)
	if err != nil {
		return nil, err
	}
	return spellSlots, nil
}

func mapCrToStats(crModel *ent.ChallangeRating) (*models.RecommendedStats, error) {
	if crModel.Edges.Stats == nil {
		return nil, &appErrors.NoRecoommendedStatsForCr{Cr: crModel.Cr}
	}
	stats := models.NewRecommendedStats(
		crModel.Cr,
		crModel.Edges.Stats.Ac,
		crModel.Edges.Stats.Hp,
		crModel.Edges.Stats.AttackModifier,
		crModel.Edges.Stats.AvarageDamage,
		crModel.Edges.Stats.Dc,
	)
	return &stats, nil
}

func mapCrToSpellSlots(crModel *ent.ChallangeRating) (*models.RecommendedSpellSlots, error) {
	if crModel.Edges.SpellSlots == nil {
		return nil, &appErrors.NoRecoommendedSpellSlotsForCr{Cr: crModel.Cr}
	}
	var recommondations []models.SpellSlotLevel
	for _, spellSlotRecommondation := range crModel.Edges.SpellSlots {
		recommendedSpellSlot := models.NewSpellSlotLevel(spellSlotRecommondation.Level, spellSlotRecommondation.Amount)
		recommondations = append(recommondations, recommendedSpellSlot)
	}
	result := models.NewRecommendedSpellSlots(crModel.Cr, recommondations)
	return &result, nil
}

func GetXpThresholdForEncounter(level int, difficultyString string) (int, error) {
	client, err := database.GetClient()
	if err != nil {
		return -1, err
	}
	thrsholdModel, err := client.EncounterDifficultyThreshold.Query().
		Where(encounterdifficultythreshold.PlayerLevel(level),
			encounterdifficultythreshold.HasDifficultyWith(difficulty.Name(difficultyString)),
		).
		Only(context.Background())
	if err != nil {
		return -1, &appErrors.UnknownDifficultyError{Difficulty: difficultyString, Wrap: err}
	}
	return int(thrsholdModel.Exp), nil
}

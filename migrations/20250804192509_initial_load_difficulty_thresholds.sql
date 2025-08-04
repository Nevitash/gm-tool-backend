-- +goose Up
-- +goose StatementBegin
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 1, 25, (SELECT id FROM public.difficulties WHERE name = 'easy'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 1, 50, (SELECT id FROM public.difficulties WHERE name = 'medium'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 1, 75, (SELECT id FROM public.difficulties WHERE name = 'hard'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 1, 100, (SELECT id FROM public.difficulties WHERE name = 'deadly'));

-- Player Level 2
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 2, 50, (SELECT id FROM public.difficulties WHERE name = 'easy'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 2, 100, (SELECT id FROM public.difficulties WHERE name = 'medium'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 2, 150, (SELECT id FROM public.difficulties WHERE name = 'hard'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 2, 200, (SELECT id FROM public.difficulties WHERE name = 'deadly'));

-- Player Level 3
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 3, 75, (SELECT id FROM public.difficulties WHERE name = 'easy'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 3, 150, (SELECT id FROM public.difficulties WHERE name = 'medium'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 3, 225, (SELECT id FROM public.difficulties WHERE name = 'hard'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 3, 400, (SELECT id FROM public.difficulties WHERE name = 'deadly'));

-- Player Level 4
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 4, 125, (SELECT id FROM public.difficulties WHERE name = 'easy'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 4, 250, (SELECT id FROM public.difficulties WHERE name = 'medium'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 4, 375, (SELECT id FROM public.difficulties WHERE name = 'hard'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 4, 500, (SELECT id FROM public.difficulties WHERE name = 'deadly'));

-- Player Level 5
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 5, 250, (SELECT id FROM public.difficulties WHERE name = 'easy'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 5, 500, (SELECT id FROM public.difficulties WHERE name = 'medium'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 5, 750, (SELECT id FROM public.difficulties WHERE name = 'hard'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 5, 1100, (SELECT id FROM public.difficulties WHERE name = 'deadly'));

-- Player Level 6
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 6, 300, (SELECT id FROM public.difficulties WHERE name = 'easy'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 6, 600, (SELECT id FROM public.difficulties WHERE name = 'medium'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 6, 900, (SELECT id FROM public.difficulties WHERE name = 'hard'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 6, 1400, (SELECT id FROM public.difficulties WHERE name = 'deadly'));

-- Player Level 7
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 7, 350, (SELECT id FROM public.difficulties WHERE name = 'easy'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 7, 750, (SELECT id FROM public.difficulties WHERE name = 'medium'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 7, 1100, (SELECT id FROM public.difficulties WHERE name = 'hard'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 7, 1700, (SELECT id FROM public.difficulties WHERE name = 'deadly'));

-- Player Level 8
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 8, 450, (SELECT id FROM public.difficulties WHERE name = 'easy'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 8, 900, (SELECT id FROM public.difficulties WHERE name = 'medium'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 8, 1400, (SELECT id FROM public.difficulties WHERE name = 'hard'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 8, 2100, (SELECT id FROM public.difficulties WHERE name = 'deadly'));

-- Player Level 9
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 9, 550, (SELECT id FROM public.difficulties WHERE name = 'easy'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 9, 1100, (SELECT id FROM public.difficulties WHERE name = 'medium'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 9, 1600, (SELECT id FROM public.difficulties WHERE name = 'hard'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 9, 2400, (SELECT id FROM public.difficulties WHERE name = 'deadly'));

-- Player Level 10
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 10, 600, (SELECT id FROM public.difficulties WHERE name = 'easy'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 10, 1200, (SELECT id FROM public.difficulties WHERE name = 'medium'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 10, 1900, (SELECT id FROM public.difficulties WHERE name = 'hard'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 10, 2800, (SELECT id FROM public.difficulties WHERE name = 'deadly'));

-- Player Level 11
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 11, 800, (SELECT id FROM public.difficulties WHERE name = 'easy'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 11, 1600, (SELECT id FROM public.difficulties WHERE name = 'medium'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 11, 2400, (SELECT id FROM public.difficulties WHERE name = 'hard'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 11, 3600, (SELECT id FROM public.difficulties WHERE name = 'deadly'));

-- Player Level 12
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 12, 1000, (SELECT id FROM public.difficulties WHERE name = 'easy'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 12, 2000, (SELECT id FROM public.difficulties WHERE name = 'medium'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 12, 3000, (SELECT id FROM public.difficulties WHERE name = 'hard'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 12, 4500, (SELECT id FROM public.difficulties WHERE name = 'deadly'));

-- Player Level 13
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 13, 1100, (SELECT id FROM public.difficulties WHERE name = 'easy'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 13, 2200, (SELECT id FROM public.difficulties WHERE name = 'medium'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 13, 3400, (SELECT id FROM public.difficulties WHERE name = 'hard'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 13, 5100, (SELECT id FROM public.difficulties WHERE name = 'deadly'));

-- Player Level 14
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 14, 1250, (SELECT id FROM public.difficulties WHERE name = 'easy'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 14, 2500, (SELECT id FROM public.difficulties WHERE name = 'medium'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 14, 3800, (SELECT id FROM public.difficulties WHERE name = 'hard'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 14, 5700, (SELECT id FROM public.difficulties WHERE name = 'deadly'));

-- Player Level 15
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 15, 1400, (SELECT id FROM public.difficulties WHERE name = 'easy'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 15, 2800, (SELECT id FROM public.difficulties WHERE name = 'medium'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 15, 4300, (SELECT id FROM public.difficulties WHERE name = 'hard'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 15, 6400, (SELECT id FROM public.difficulties WHERE name = 'deadly'));

-- Player Level 16
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 16, 1600, (SELECT id FROM public.difficulties WHERE name = 'easy'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 16, 3200, (SELECT id FROM public.difficulties WHERE name = 'medium'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 16, 4800, (SELECT id FROM public.difficulties WHERE name = 'hard'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 16, 7200, (SELECT id FROM public.difficulties WHERE name = 'deadly'));

-- Player Level 17
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 17, 2000, (SELECT id FROM public.difficulties WHERE name = 'easy'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 17, 3900, (SELECT id FROM public.difficulties WHERE name = 'medium'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 17, 5900, (SELECT id FROM public.difficulties WHERE name = 'hard'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 17, 8800, (SELECT id FROM public.difficulties WHERE name = 'deadly'));

-- Player Level 18
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 18, 2100, (SELECT id FROM public.difficulties WHERE name = 'easy'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 18, 4200, (SELECT id FROM public.difficulties WHERE name = 'medium'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 18, 6300, (SELECT id FROM public.difficulties WHERE name = 'hard'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 18, 9500, (SELECT id FROM public.difficulties WHERE name = 'deadly'));

-- Player Level 19
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 19, 2400, (SELECT id FROM public.difficulties WHERE name = 'easy'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 19, 4900, (SELECT id FROM public.difficulties WHERE name = 'medium'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 19, 7300, (SELECT id FROM public.difficulties WHERE name = 'hard'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 19, 10900, (SELECT id FROM public.difficulties WHERE name = 'deadly'));

-- Player Level 20
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 20, 2800, (SELECT id FROM public.difficulties WHERE name = 'easy'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 20, 5700, (SELECT id FROM public.difficulties WHERE name = 'medium'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 20, 8500, (SELECT id FROM public.difficulties WHERE name = 'hard'));
INSERT INTO public.encounter_difficulty_thresholds (id, player_level, exp, difficulty_thresholds)
VALUES (gen_random_uuid(), 20, 12700, (SELECT id FROM public.difficulties WHERE name = 'deadly'));
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DELETE FROM public.encounter_difficulty_thresholds
WHERE player_level IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20);
-- +goose StatementEnd

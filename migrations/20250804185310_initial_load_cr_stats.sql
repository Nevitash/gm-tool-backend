-- +goose Up
-- +goose StatementBegin
-- Ensure the uuid-ossp extension is enabled for gen_random_uuid()
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Insert statements for recommended stats per CR.
-- The 'challange_rating_stats' UUID is dynamically fetched from the 'challange_ratings' table
-- based on the 'cr' string. This requires that the 'challange_ratings' table is already populated
-- with the corresponding 'cr' values and their UUIDs.

-- CR "0"
INSERT INTO public.cr_stats (id, ac, hp, attack_modifier, avarage_damage, dc, challange_rating_stats)
VALUES (gen_random_uuid(), 13, 3, 2, 1, 9, (SELECT id FROM challange_ratings WHERE cr = '0'));

-- CR "1/8"
INSERT INTO public.cr_stats (id, ac, hp, attack_modifier, avarage_damage, dc, challange_rating_stats)
VALUES (gen_random_uuid(), 13, 9, 3, 3, 10, (SELECT id FROM challange_ratings WHERE cr = '1/8'));

-- CR "1/4"
INSERT INTO public.cr_stats (id, ac, hp, attack_modifier, avarage_damage, dc, challange_rating_stats)
VALUES (gen_random_uuid(), 13, 15, 3, 6, 10, (SELECT id FROM challange_ratings WHERE cr = '1/4'));

-- CR "1/2"
INSERT INTO public.cr_stats (id, ac, hp, attack_modifier, avarage_damage, dc, challange_rating_stats)
VALUES (gen_random_uuid(), 14, 24, 4, 9, 11, (SELECT id FROM challange_ratings WHERE cr = '1/2'));

-- CR "1"
INSERT INTO public.cr_stats (id, ac, hp, attack_modifier, avarage_damage, dc, challange_rating_stats)
VALUES (gen_random_uuid(), 14, 30, 4, 12, 11, (SELECT id FROM challange_ratings WHERE cr = '1'));

-- CR "2"
INSERT INTO public.cr_stats (id, ac, hp, attack_modifier, avarage_damage, dc, challange_rating_stats)
VALUES (gen_random_uuid(), 14, 45, 5, 18, 12, (SELECT id FROM challange_ratings WHERE cr = '2'));

-- CR "3"
INSERT INTO public.cr_stats (id, ac, hp, attack_modifier, avarage_damage, dc, challange_rating_stats)
VALUES (gen_random_uuid(), 15, 60, 5, 24, 12, (SELECT id FROM challange_ratings WHERE cr = '3'));

-- CR "4"
INSERT INTO public.cr_stats (id, ac, hp, attack_modifier, avarage_damage, dc, challange_rating_stats)
VALUES (gen_random_uuid(), 15, 75, 6, 30, 13, (SELECT id FROM challange_ratings WHERE cr = '4'));

-- CR "5"
INSERT INTO public.cr_stats (id, ac, hp, attack_modifier, avarage_damage, dc, challange_rating_stats)
VALUES (gen_random_uuid(), 15, 90, 6, 36, 13, (SELECT id FROM challange_ratings WHERE cr = '5'));

-- CR "6"
INSERT INTO public.cr_stats (id, ac, hp, attack_modifier, avarage_damage, dc, challange_rating_stats)
VALUES (gen_random_uuid(), 16, 105, 7, 42, 14, (SELECT id FROM challange_ratings WHERE cr = '6'));

-- CR "7"
INSERT INTO public.cr_stats (id, ac, hp, attack_modifier, avarage_damage, dc, challange_rating_stats)
VALUES (gen_random_uuid(), 16, 120, 7, 48, 14, (SELECT id FROM challange_ratings WHERE cr = '7'));

-- CR "8"
INSERT INTO public.cr_stats (id, ac, hp, attack_modifier, avarage_damage, dc, challange_rating_stats)
VALUES (gen_random_uuid(), 16, 135, 8, 54, 15, (SELECT id FROM challange_ratings WHERE cr = '8'));

-- CR "9"
INSERT INTO public.cr_stats (id, ac, hp, attack_modifier, avarage_damage, dc, challange_rating_stats)
VALUES (gen_random_uuid(), 17, 150, 8, 60, 15, (SELECT id FROM challange_ratings WHERE cr = '9'));

-- CR "10"
INSERT INTO public.cr_stats (id, ac, hp, attack_modifier, avarage_damage, dc, challange_rating_stats)
VALUES (gen_random_uuid(), 17, 165, 9, 66, 16, (SELECT id FROM challange_ratings WHERE cr = '10'));

-- CR "11"
INSERT INTO public.cr_stats (id, ac, hp, attack_modifier, avarage_damage, dc, challange_rating_stats)
VALUES (gen_random_uuid(), 17, 180, 9, 72, 16, (SELECT id FROM challange_ratings WHERE cr = '11'));

-- CR "12"
INSERT INTO public.cr_stats (id, ac, hp, attack_modifier, avarage_damage, dc, challange_rating_stats)
VALUES (gen_random_uuid(), 18, 195, 10, 78, 17, (SELECT id FROM challange_ratings WHERE cr = '12'));

-- CR "13"
INSERT INTO public.cr_stats (id, ac, hp, attack_modifier, avarage_damage, dc, challange_rating_stats)
VALUES (gen_random_uuid(), 18, 210, 10, 84, 17, (SELECT id FROM challange_ratings WHERE cr = '13'));

-- CR "14"
INSERT INTO public.cr_stats (id, ac, hp, attack_modifier, avarage_damage, dc, challange_rating_stats)
VALUES (gen_random_uuid(), 18, 225, 11, 90, 18, (SELECT id FROM challange_ratings WHERE cr = '14'));

-- CR "15"
INSERT INTO public.cr_stats (id, ac, hp, attack_modifier, avarage_damage, dc, challange_rating_stats)
VALUES (gen_random_uuid(), 19, 240, 11, 96, 18, (SELECT id FROM challange_ratings WHERE cr = '15'));

-- CR "16"
INSERT INTO public.cr_stats (id, ac, hp, attack_modifier, avarage_damage, dc, challange_rating_stats)
VALUES (gen_random_uuid(), 19, 255, 12, 102, 19, (SELECT id FROM challange_ratings WHERE cr = '16'));

-- CR "17"
INSERT INTO public.cr_stats (id, ac, hp, attack_modifier, avarage_damage, dc, challange_rating_stats)
VALUES (gen_random_uuid(), 19, 270, 12, 108, 19, (SELECT id FROM challange_ratings WHERE cr = '17'));

-- CR "18"
INSERT INTO public.cr_stats (id, ac, hp, attack_modifier, avarage_damage, dc, challange_rating_stats)
VALUES (gen_random_uuid(), 20, 285, 13, 114, 20, (SELECT id FROM challange_ratings WHERE cr = '18'));

-- CR "19"
INSERT INTO public.cr_stats (id, ac, hp, attack_modifier, avarage_damage, dc, challange_rating_stats)
VALUES (gen_random_uuid(), 20, 300, 13, 120, 20, (SELECT id FROM challange_ratings WHERE cr = '19'));

-- CR "20"
INSERT INTO public.cr_stats (id, ac, hp, attack_modifier, avarage_damage, dc, challange_rating_stats)
VALUES (gen_random_uuid(), 20, 315, 14, 126, 21, (SELECT id FROM challange_ratings WHERE cr = '20'));

-- CR "21"
INSERT INTO public.cr_stats (id, ac, hp, attack_modifier, avarage_damage, dc, challange_rating_stats)
VALUES (gen_random_uuid(), 21, 350, 14, 132, 21, (SELECT id FROM challange_ratings WHERE cr = '21'));

-- CR "22"
INSERT INTO public.cr_stats (id, ac, hp, attack_modifier, avarage_damage, dc, challange_rating_stats)
VALUES (gen_random_uuid(), 21, 400, 15, 138, 22, (SELECT id FROM challange_ratings WHERE cr = '22'));

-- CR "23"
INSERT INTO public.cr_stats (id, ac, hp, attack_modifier, avarage_damage, dc, challange_rating_stats)
VALUES (gen_random_uuid(), 21, 450, 15, 144, 22, (SELECT id FROM challange_ratings WHERE cr = '23'));

-- CR "24"
INSERT INTO public.cr_stats (id, ac, hp, attack_modifier, avarage_damage, dc, challange_rating_stats)
VALUES (gen_random_uuid(), 22, 500, 16, 150, 23, (SELECT id FROM challange_ratings WHERE cr = '24'));

-- CR "25"
INSERT INTO public.cr_stats (id, ac, hp, attack_modifier, avarage_damage, dc, challange_rating_stats)
VALUES (gen_random_uuid(), 22, 550, 16, 156, 23, (SELECT id FROM challange_ratings WHERE cr = '25'));

-- CR "26"
INSERT INTO public.cr_stats (id, ac, hp, attack_modifier, avarage_damage, dc, challange_rating_stats)
VALUES (gen_random_uuid(), 22, 600, 17, 162, 24, (SELECT id FROM challange_ratings WHERE cr = '26'));

-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
-- Delete statements for recommended stats per CR.
-- These statements will remove all entries from 'cr_stats'
-- that are linked to a specific 'cr' value in the 'challange_ratings' table.

DELETE FROM public.cr_stats WHERE challange_rating_stats = (SELECT id FROM challange_ratings WHERE cr = '0');
DELETE FROM public.cr_stats WHERE challange_rating_stats = (SELECT id FROM challange_ratings WHERE cr = '1/8');
DELETE FROM public.cr_stats WHERE challange_rating_stats = (SELECT id FROM challange_ratings WHERE cr = '1/4');
DELETE FROM public.cr_stats WHERE challange_rating_stats = (SELECT id FROM challange_ratings WHERE cr = '1/2');
DELETE FROM public.cr_stats WHERE challange_rating_stats = (SELECT id FROM challange_ratings WHERE cr = '1');
DELETE FROM public.cr_stats WHERE challange_rating_stats = (SELECT id FROM challange_ratings WHERE cr = '2');
DELETE FROM public.cr_stats WHERE challange_rating_stats = (SELECT id FROM challange_ratings WHERE cr = '3');
DELETE FROM public.cr_stats WHERE challange_rating_stats = (SELECT id FROM challange_ratings WHERE cr = '4');
DELETE FROM public.cr_stats WHERE challange_rating_stats = (SELECT id FROM challange_ratings WHERE cr = '5');
DELETE FROM public.cr_stats WHERE challange_rating_stats = (SELECT id FROM challange_ratings WHERE cr = '6');
DELETE FROM public.cr_stats WHERE challange_rating_stats = (SELECT id FROM challange_ratings WHERE cr = '7');
DELETE FROM public.cr_stats WHERE challange_rating_stats = (SELECT id FROM challange_ratings WHERE cr = '8');
DELETE FROM public.cr_stats WHERE challange_rating_stats = (SELECT id FROM challange_ratings WHERE cr = '9');
DELETE FROM public.cr_stats WHERE challange_rating_stats = (SELECT id FROM challange_ratings WHERE cr = '10');
DELETE FROM public.cr_stats WHERE challange_rating_stats = (SELECT id FROM challange_ratings WHERE cr = '11');
DELETE FROM public.cr_stats WHERE challange_rating_stats = (SELECT id FROM challange_ratings WHERE cr = '12');
DELETE FROM public.cr_stats WHERE challange_rating_stats = (SELECT id FROM challange_ratings WHERE cr = '13');
DELETE FROM public.cr_stats WHERE challange_rating_stats = (SELECT id FROM challange_ratings WHERE cr = '14');
DELETE FROM public.cr_stats WHERE challange_rating_stats = (SELECT id FROM challange_ratings WHERE cr = '15');
DELETE FROM public.cr_stats WHERE challange_rating_stats = (SELECT id FROM challange_ratings WHERE cr = '16');
DELETE FROM public.cr_stats WHERE challange_rating_stats = (SELECT id FROM challange_ratings WHERE cr = '17');
DELETE FROM public.cr_stats WHERE challange_rating_stats = (SELECT id FROM challange_ratings WHERE cr = '18');
DELETE FROM public.cr_stats WHERE challange_rating_stats = (SELECT id FROM challange_ratings WHERE cr = '19');
DELETE FROM public.cr_stats WHERE challange_rating_stats = (SELECT id FROM challange_ratings WHERE cr = '20');
DELETE FROM public.cr_stats WHERE challange_rating_stats = (SELECT id FROM challange_ratings WHERE cr = '21');
DELETE FROM public.cr_stats WHERE challange_rating_stats = (SELECT id FROM challange_ratings WHERE cr = '22');
DELETE FROM public.cr_stats WHERE challange_rating_stats = (SELECT id FROM challange_ratings WHERE cr = '23');
DELETE FROM public.cr_stats WHERE challange_rating_stats = (SELECT id FROM challange_ratings WHERE cr = '24');
DELETE FROM public.cr_stats WHERE challange_rating_stats = (SELECT id FROM challange_ratings WHERE cr = '25');
DELETE FROM public.cr_stats WHERE challange_rating_stats = (SELECT id FROM challange_ratings WHERE cr = '26');

-- +goose StatementEnd

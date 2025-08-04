-- +goose Up
-- +goose StatementBegin
-- Ensure the uuid-ossp extension is enabled for gen_random_uuid()
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Insert statements for each CR and its spell slots.
-- The 'challange_rating_spell_slots' UUID is dynamically fetched from the 'challange_ratings' table
-- based on the 'cr' string. This requires that the 'challange_ratings' table is already populated
-- with the corresponding 'cr' values and their UUIDs.

-- CR "0"
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 0, 1, (SELECT id FROM challange_ratings WHERE cr = '0')); -- Cantrips
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 1, 2, (SELECT id FROM challange_ratings WHERE cr = '0'));

-- CR "1/8"
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 0, 2, (SELECT id FROM challange_ratings WHERE cr = '1/8'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 1, 2, (SELECT id FROM challange_ratings WHERE cr = '1/8'));

-- CR "1/4"
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 0, 2, (SELECT id FROM challange_ratings WHERE cr = '1/4'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 1, 3, (SELECT id FROM challange_ratings WHERE cr = '1/4'));

-- CR "1/2"
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 0, 2, (SELECT id FROM challange_ratings WHERE cr = '1/2'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 1, 3, (SELECT id FROM challange_ratings WHERE cr = '1/2'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 2, 1, (SELECT id FROM challange_ratings WHERE cr = '1/2'));

-- CR "1"
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 0, 3, (SELECT id FROM challange_ratings WHERE cr = '1'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 1, 3, (SELECT id FROM challange_ratings WHERE cr = '1'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 2, 1, (SELECT id FROM challange_ratings WHERE cr = '1'));

-- CR "2"
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 0, 3, (SELECT id FROM challange_ratings WHERE cr = '2'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 1, 4, (SELECT id FROM challange_ratings WHERE cr = '2'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 2, 2, (SELECT id FROM challange_ratings WHERE cr = '2'));

-- CR "3"
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 0, 3, (SELECT id FROM challange_ratings WHERE cr = '3'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 1, 4, (SELECT id FROM challange_ratings WHERE cr = '3'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 2, 3, (SELECT id FROM challange_ratings WHERE cr = '3'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 3, 1, (SELECT id FROM challange_ratings WHERE cr = '3'));

-- CR "4"
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 0, 4, (SELECT id FROM challange_ratings WHERE cr = '4'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 1, 4, (SELECT id FROM challange_ratings WHERE cr = '4'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 2, 3, (SELECT id FROM challange_ratings WHERE cr = '4'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 3, 2, (SELECT id FROM challange_ratings WHERE cr = '4'));

-- CR "5"
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 0, 4, (SELECT id FROM challange_ratings WHERE cr = '5'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 1, 4, (SELECT id FROM challange_ratings WHERE cr = '5'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 2, 3, (SELECT id FROM challange_ratings WHERE cr = '5'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 3, 3, (SELECT id FROM challange_ratings WHERE cr = '5'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 4, 1, (SELECT id FROM challange_ratings WHERE cr = '5'));

-- CR "6"
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 0, 4, (SELECT id FROM challange_ratings WHERE cr = '6'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 1, 4, (SELECT id FROM challange_ratings WHERE cr = '6'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 2, 3, (SELECT id FROM challange_ratings WHERE cr = '6'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 3, 3, (SELECT id FROM challange_ratings WHERE cr = '6'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 4, 2, (SELECT id FROM challange_ratings WHERE cr = '6'));

-- CR "7"
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 0, 4, (SELECT id FROM challange_ratings WHERE cr = '7'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 1, 4, (SELECT id FROM challange_ratings WHERE cr = '7'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 2, 3, (SELECT id FROM challange_ratings WHERE cr = '7'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 3, 3, (SELECT id FROM challange_ratings WHERE cr = '7'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 4, 2, (SELECT id FROM challange_ratings WHERE cr = '7'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 5, 1, (SELECT id FROM challange_ratings WHERE cr = '7'));

-- CR "8"
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 0, 5, (SELECT id FROM challange_ratings WHERE cr = '8'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 1, 4, (SELECT id FROM challange_ratings WHERE cr = '8'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 2, 3, (SELECT id FROM challange_ratings WHERE cr = '8'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 3, 3, (SELECT id FROM challange_ratings WHERE cr = '8'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 4, 2, (SELECT id FROM challange_ratings WHERE cr = '8'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 5, 2, (SELECT id FROM challange_ratings WHERE cr = '8'));

-- CR "9"
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 0, 5, (SELECT id FROM challange_ratings WHERE cr = '9'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 1, 4, (SELECT id FROM challange_ratings WHERE cr = '9'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 2, 3, (SELECT id FROM challange_ratings WHERE cr = '9'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 3, 3, (SELECT id FROM challange_ratings WHERE cr = '9'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 4, 3, (SELECT id FROM challange_ratings WHERE cr = '9'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 5, 2, (SELECT id FROM challange_ratings WHERE cr = '9'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 6, 1, (SELECT id FROM challange_ratings WHERE cr = '9'));

-- CR "10"
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 0, 5, (SELECT id FROM challange_ratings WHERE cr = '10'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 1, 4, (SELECT id FROM challange_ratings WHERE cr = '10'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 2, 3, (SELECT id FROM challange_ratings WHERE cr = '10'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 3, 3, (SELECT id FROM challange_ratings WHERE cr = '10'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 4, 3, (SELECT id FROM challange_ratings WHERE cr = '10'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 5, 2, (SELECT id FROM challange_ratings WHERE cr = '10'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 6, 1, (SELECT id FROM challange_ratings WHERE cr = '10'));

-- CR "11"
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 0, 5, (SELECT id FROM challange_ratings WHERE cr = '11'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 1, 4, (SELECT id FROM challange_ratings WHERE cr = '11'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 2, 3, (SELECT id FROM challange_ratings WHERE cr = '11'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 3, 3, (SELECT id FROM challange_ratings WHERE cr = '11'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 4, 3, (SELECT id FROM challange_ratings WHERE cr = '11'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 5, 2, (SELECT id FROM challange_ratings WHERE cr = '11'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 6, 2, (SELECT id FROM challange_ratings WHERE cr = '11'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 7, 1, (SELECT id FROM challange_ratings WHERE cr = '11'));

-- CR "12"
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 0, 5, (SELECT id FROM challange_ratings WHERE cr = '12'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 1, 4, (SELECT id FROM challange_ratings WHERE cr = '12'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 2, 3, (SELECT id FROM challange_ratings WHERE cr = '12'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 3, 3, (SELECT id FROM challange_ratings WHERE cr = '12'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 4, 3, (SELECT id FROM challange_ratings WHERE cr = '12'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 5, 2, (SELECT id FROM challange_ratings WHERE cr = '12'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 6, 2, (SELECT id FROM challange_ratings WHERE cr = '12'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 7, 1, (SELECT id FROM challange_ratings WHERE cr = '12'));

-- CR "13"
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 0, 5, (SELECT id FROM challange_ratings WHERE cr = '13'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 1, 4, (SELECT id FROM challange_ratings WHERE cr = '13'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 2, 3, (SELECT id FROM challange_ratings WHERE cr = '13'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 3, 3, (SELECT id FROM challange_ratings WHERE cr = '13'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 4, 3, (SELECT id FROM challange_ratings WHERE cr = '13'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 5, 2, (SELECT id FROM challange_ratings WHERE cr = '13'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 6, 2, (SELECT id FROM challange_ratings WHERE cr = '13'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 7, 1, (SELECT id FROM challange_ratings WHERE cr = '13'));

-- CR "14"
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 0, 6, (SELECT id FROM challange_ratings WHERE cr = '14'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 1, 4, (SELECT id FROM challange_ratings WHERE cr = '14'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 2, 3, (SELECT id FROM challange_ratings WHERE cr = '14'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 3, 3, (SELECT id FROM challange_ratings WHERE cr = '14'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 4, 3, (SELECT id FROM challange_ratings WHERE cr = '14'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 5, 2, (SELECT id FROM challange_ratings WHERE cr = '14'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 6, 2, (SELECT id FROM challange_ratings WHERE cr = '14'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 7, 2, (SELECT id FROM challange_ratings WHERE cr = '14'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 8, 1, (SELECT id FROM challange_ratings WHERE cr = '14'));

-- CR "15"
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 0, 6, (SELECT id FROM challange_ratings WHERE cr = '15'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 1, 4, (SELECT id FROM challange_ratings WHERE cr = '15'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 2, 3, (SELECT id FROM challange_ratings WHERE cr = '15'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 3, 3, (SELECT id FROM challange_ratings WHERE cr = '15'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 4, 3, (SELECT id FROM challange_ratings WHERE cr = '15'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 5, 2, (SELECT id FROM challange_ratings WHERE cr = '15'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 6, 2, (SELECT id FROM challange_ratings WHERE cr = '15'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 7, 2, (SELECT id FROM challange_ratings WHERE cr = '15'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 8, 1, (SELECT id FROM challange_ratings WHERE cr = '15'));

-- CR "16"
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 0, 6, (SELECT id FROM challange_ratings WHERE cr = '16'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 1, 4, (SELECT id FROM challange_ratings WHERE cr = '16'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 2, 3, (SELECT id FROM challange_ratings WHERE cr = '16'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 3, 3, (SELECT id FROM challange_ratings WHERE cr = '16'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 4, 3, (SELECT id FROM challange_ratings WHERE cr = '16'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 5, 2, (SELECT id FROM challange_ratings WHERE cr = '16'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 6, 2, (SELECT id FROM challange_ratings WHERE cr = '16'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 7, 2, (SELECT id FROM challange_ratings WHERE cr = '16'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 8, 1, (SELECT id FROM challange_ratings WHERE cr = '16'));

-- CR "17"
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 0, 6, (SELECT id FROM challange_ratings WHERE cr = '17'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 1, 4, (SELECT id FROM challange_ratings WHERE cr = '17'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 2, 3, (SELECT id FROM challange_ratings WHERE cr = '17'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 3, 3, (SELECT id FROM challange_ratings WHERE cr = '17'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 4, 3, (SELECT id FROM challange_ratings WHERE cr = '17'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 5, 2, (SELECT id FROM challange_ratings WHERE cr = '17'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 6, 2, (SELECT id FROM challange_ratings WHERE cr = '17'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 7, 2, (SELECT id FROM challange_ratings WHERE cr = '17'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 8, 2, (SELECT id FROM challange_ratings WHERE cr = '17'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 9, 1, (SELECT id FROM challange_ratings WHERE cr = '17'));

-- CR "18"
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 0, 6, (SELECT id FROM challange_ratings WHERE cr = '18'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 1, 4, (SELECT id FROM challange_ratings WHERE cr = '18'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 2, 3, (SELECT id FROM challange_ratings WHERE cr = '18'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 3, 3, (SELECT id FROM challange_ratings WHERE cr = '18'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 4, 3, (SELECT id FROM challange_ratings WHERE cr = '18'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 5, 2, (SELECT id FROM challange_ratings WHERE cr = '18'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 6, 2, (SELECT id FROM challange_ratings WHERE cr = '18'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 7, 2, (SELECT id FROM challange_ratings WHERE cr = '18'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 8, 2, (SELECT id FROM challange_ratings WHERE cr = '18'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 9, 1, (SELECT id FROM challange_ratings WHERE cr = '18'));

-- CR "19"
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 0, 6, (SELECT id FROM challange_ratings WHERE cr = '19'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 1, 4, (SELECT id FROM challange_ratings WHERE cr = '19'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 2, 3, (SELECT id FROM challange_ratings WHERE cr = '19'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 3, 3, (SELECT id FROM challange_ratings WHERE cr = '19'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 4, 3, (SELECT id FROM challange_ratings WHERE cr = '19'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 5, 2, (SELECT id FROM challange_ratings WHERE cr = '19'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 6, 2, (SELECT id FROM challange_ratings WHERE cr = '19'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 7, 2, (SELECT id FROM challange_ratings WHERE cr = '19'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 8, 2, (SELECT id FROM challange_ratings WHERE cr = '19'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 9, 1, (SELECT id FROM challange_ratings WHERE cr = '19'));

-- CR "20"
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 0, 6, (SELECT id FROM challange_ratings WHERE cr = '20'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 1, 4, (SELECT id FROM challange_ratings WHERE cr = '20'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 2, 3, (SELECT id FROM challange_ratings WHERE cr = '20'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 3, 3, (SELECT id FROM challange_ratings WHERE cr = '20'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 4, 3, (SELECT id FROM challange_ratings WHERE cr = '20'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 5, 2, (SELECT id FROM challange_ratings WHERE cr = '20'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 6, 2, (SELECT id FROM challange_ratings WHERE cr = '20'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 7, 2, (SELECT id FROM challange_ratings WHERE cr = '20'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 8, 2, (SELECT id FROM challange_ratings WHERE cr = '20'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 9, 1, (SELECT id FROM challange_ratings WHERE cr = '20'));

-- CR "21"
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 0, 7, (SELECT id FROM challange_ratings WHERE cr = '21'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 1, 4, (SELECT id FROM challange_ratings WHERE cr = '21'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 2, 3, (SELECT id FROM challange_ratings WHERE cr = '21'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 3, 3, (SELECT id FROM challange_ratings WHERE cr = '21'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 4, 3, (SELECT id FROM challange_ratings WHERE cr = '21'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 5, 3, (SELECT id FROM challange_ratings WHERE cr = '21'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 6, 2, (SELECT id FROM challange_ratings WHERE cr = '21'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 7, 2, (SELECT id FROM challange_ratings WHERE cr = '21'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 8, 2, (SELECT id FROM challange_ratings WHERE cr = '21'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 9, 1, (SELECT id FROM challange_ratings WHERE cr = '21'));

-- CR "22"
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 0, 7, (SELECT id FROM challange_ratings WHERE cr = '22'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 1, 4, (SELECT id FROM challange_ratings WHERE cr = '22'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 2, 3, (SELECT id FROM challange_ratings WHERE cr = '22'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 3, 3, (SELECT id FROM challange_ratings WHERE cr = '22'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 4, 3, (SELECT id FROM challange_ratings WHERE cr = '22'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 5, 3, (SELECT id FROM challange_ratings WHERE cr = '22'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 6, 2, (SELECT id FROM challange_ratings WHERE cr = '22'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 7, 2, (SELECT id FROM challange_ratings WHERE cr = '22'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 8, 2, (SELECT id FROM challange_ratings WHERE cr = '22'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 9, 1, (SELECT id FROM challange_ratings WHERE cr = '22'));

-- CR "23"
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 0, 7, (SELECT id FROM challange_ratings WHERE cr = '23'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 1, 4, (SELECT id FROM challange_ratings WHERE cr = '23'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 2, 3, (SELECT id FROM challange_ratings WHERE cr = '23'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 3, 3, (SELECT id FROM challange_ratings WHERE cr = '23'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 4, 3, (SELECT id FROM challange_ratings WHERE cr = '23'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 5, 3, (SELECT id FROM challange_ratings WHERE cr = '23'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 6, 2, (SELECT id FROM challange_ratings WHERE cr = '23'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 7, 2, (SELECT id FROM challange_ratings WHERE cr = '23'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 8, 2, (SELECT id FROM challange_ratings WHERE cr = '23'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 9, 1, (SELECT id FROM challange_ratings WHERE cr = '23'));

-- CR "24"
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 0, 7, (SELECT id FROM challange_ratings WHERE cr = '24'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 1, 4, (SELECT id FROM challange_ratings WHERE cr = '24'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 2, 3, (SELECT id FROM challange_ratings WHERE cr = '24'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 3, 3, (SELECT id FROM challange_ratings WHERE cr = '24'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 4, 3, (SELECT id FROM challange_ratings WHERE cr = '24'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 5, 3, (SELECT id FROM challange_ratings WHERE cr = '24'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 6, 2, (SELECT id FROM challange_ratings WHERE cr = '24'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 7, 2, (SELECT id FROM challange_ratings WHERE cr = '24'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 8, 2, (SELECT id FROM challange_ratings WHERE cr = '24'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 9, 1, (SELECT id FROM challange_ratings WHERE cr = '24'));

-- CR "25"
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 0, 7, (SELECT id FROM challange_ratings WHERE cr = '25'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 1, 4, (SELECT id FROM challange_ratings WHERE cr = '25'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 2, 3, (SELECT id FROM challange_ratings WHERE cr = '25'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 3, 3, (SELECT id FROM challange_ratings WHERE cr = '25'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 4, 3, (SELECT id FROM challange_ratings WHERE cr = '25'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 5, 3, (SELECT id FROM challange_ratings WHERE cr = '25'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 6, 2, (SELECT id FROM challange_ratings WHERE cr = '25'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 7, 2, (SELECT id FROM challange_ratings WHERE cr = '25'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 8, 2, (SELECT id FROM challange_ratings WHERE cr = '25'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 9, 1, (SELECT id FROM challange_ratings WHERE cr = '25'));

-- CR "26"
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 0, 7, (SELECT id FROM challange_ratings WHERE cr = '26'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 1, 4, (SELECT id FROM challange_ratings WHERE cr = '26'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 2, 3, (SELECT id FROM challange_ratings WHERE cr = '26'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 3, 3, (SELECT id FROM challange_ratings WHERE cr = '26'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 4, 3, (SELECT id FROM challange_ratings WHERE cr = '26'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 5, 3, (SELECT id FROM challange_ratings WHERE cr = '26'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 6, 2, (SELECT id FROM challange_ratings WHERE cr = '26'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 7, 2, (SELECT id FROM challange_ratings WHERE cr = '26'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 8, 2, (SELECT id FROM challange_ratings WHERE cr = '26'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 9, 1, (SELECT id FROM challange_ratings WHERE cr = '26'));

-- CR "27"
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 0, 8, (SELECT id FROM challange_ratings WHERE cr = '27'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 1, 4, (SELECT id FROM challange_ratings WHERE cr = '27'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 2, 3, (SELECT id FROM challange_ratings WHERE cr = '27'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 3, 3, (SELECT id FROM challange_ratings WHERE cr = '27'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 4, 3, (SELECT id FROM challange_ratings WHERE cr = '27'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 5, 3, (SELECT id FROM challange_ratings WHERE cr = '27'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 6, 2, (SELECT id FROM challange_ratings WHERE cr = '27'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 7, 2, (SELECT id FROM challange_ratings WHERE cr = '27'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 8, 2, (SELECT id FROM challange_ratings WHERE cr = '27'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 9, 2, (SELECT id FROM challange_ratings WHERE cr = '27'));

-- CR "28"
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 0, 8, (SELECT id FROM challange_ratings WHERE cr = '28'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 1, 4, (SELECT id FROM challange_ratings WHERE cr = '28'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 2, 3, (SELECT id FROM challange_ratings WHERE cr = '28'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 3, 3, (SELECT id FROM challange_ratings WHERE cr = '28'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 4, 3, (SELECT id FROM challange_ratings WHERE cr = '28'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 5, 3, (SELECT id FROM challange_ratings WHERE cr = '28'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 6, 2, (SELECT id FROM challange_ratings WHERE cr = '28'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 7, 2, (SELECT id FROM challange_ratings WHERE cr = '28'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 8, 2, (SELECT id FROM challange_ratings WHERE cr = '28'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 9, 2, (SELECT id FROM challange_ratings WHERE cr = '28'));

-- CR "29"
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 0, 8, (SELECT id FROM challange_ratings WHERE cr = '29'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 1, 4, (SELECT id FROM challange_ratings WHERE cr = '29'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 2, 3, (SELECT id FROM challange_ratings WHERE cr = '29'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 3, 3, (SELECT id FROM challange_ratings WHERE cr = '29'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 4, 3, (SELECT id FROM challange_ratings WHERE cr = '29'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 5, 3, (SELECT id FROM challange_ratings WHERE cr = '29'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 6, 2, (SELECT id FROM challange_ratings WHERE cr = '29'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 7, 2, (SELECT id FROM challange_ratings WHERE cr = '29'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 8, 2, (SELECT id FROM challange_ratings WHERE cr = '29'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 9, 2, (SELECT id FROM challange_ratings WHERE cr = '29'));

-- CR "30"
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 0, 8, (SELECT id FROM challange_ratings WHERE cr = '30'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 1, 4, (SELECT id FROM challange_ratings WHERE cr = '30'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 2, 3, (SELECT id FROM challange_ratings WHERE cr = '30'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 3, 3, (SELECT id FROM challange_ratings WHERE cr = '30'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 4, 3, (SELECT id FROM challange_ratings WHERE cr = '30'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 5, 3, (SELECT id FROM challange_ratings WHERE cr = '30'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 6, 2, (SELECT id FROM challange_ratings WHERE cr = '30'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 7, 2, (SELECT id FROM challange_ratings WHERE cr = '30'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 8, 2, (SELECT id FROM challange_ratings WHERE cr = '30'));
INSERT INTO cr_spell_slots (id, level, amount, challange_rating_spell_slots)
VALUES (gen_random_uuid(), 9, 2, (SELECT id FROM challange_ratings WHERE cr = '30'));
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DELETE FROM cr_spell_slots WHERE challange_rating_spell_slots = (SELECT id FROM challange_ratings WHERE cr = '0');
DELETE FROM cr_spell_slots WHERE challange_rating_spell_slots = (SELECT id FROM challange_ratings WHERE cr = '1/8');
DELETE FROM cr_spell_slots WHERE challange_rating_spell_slots = (SELECT id FROM challange_ratings WHERE cr = '1/4');
DELETE FROM cr_spell_slots WHERE challange_rating_spell_slots = (SELECT id FROM challange_ratings WHERE cr = '1/2');
DELETE FROM cr_spell_slots WHERE challange_rating_spell_slots = (SELECT id FROM challange_ratings WHERE cr = '1');
DELETE FROM cr_spell_slots WHERE challange_rating_spell_slots = (SELECT id FROM challange_ratings WHERE cr = '2');
DELETE FROM cr_spell_slots WHERE challange_rating_spell_slots = (SELECT id FROM challange_ratings WHERE cr = '3');
DELETE FROM cr_spell_slots WHERE challange_rating_spell_slots = (SELECT id FROM challange_ratings WHERE cr = '4');
DELETE FROM cr_spell_slots WHERE challange_rating_spell_slots = (SELECT id FROM challange_ratings WHERE cr = '5');
DELETE FROM cr_spell_slots WHERE challange_rating_spell_slots = (SELECT id FROM challange_ratings WHERE cr = '6');
DELETE FROM cr_spell_slots WHERE challange_rating_spell_slots = (SELECT id FROM challange_ratings WHERE cr = '7');
DELETE FROM cr_spell_slots WHERE challange_rating_spell_slots = (SELECT id FROM challange_ratings WHERE cr = '8');
DELETE FROM cr_spell_slots WHERE challange_rating_spell_slots = (SELECT id FROM challange_ratings WHERE cr = '9');
DELETE FROM cr_spell_slots WHERE challange_rating_spell_slots = (SELECT id FROM challange_ratings WHERE cr = '10');
DELETE FROM cr_spell_slots WHERE challange_rating_spell_slots = (SELECT id FROM challange_ratings WHERE cr = '11');
DELETE FROM cr_spell_slots WHERE challange_rating_spell_slots = (SELECT id FROM challange_ratings WHERE cr = '12');
DELETE FROM cr_spell_slots WHERE challange_rating_spell_slots = (SELECT id FROM challange_ratings WHERE cr = '13');
DELETE FROM cr_spell_slots WHERE challange_rating_spell_slots = (SELECT id FROM challange_ratings WHERE cr = '14');
DELETE FROM cr_spell_slots WHERE challange_rating_spell_slots = (SELECT id FROM challange_ratings WHERE cr = '15');
DELETE FROM cr_spell_slots WHERE challange_rating_spell_slots = (SELECT id FROM challange_ratings WHERE cr = '16');
DELETE FROM cr_spell_slots WHERE challange_rating_spell_slots = (SELECT id FROM challange_ratings WHERE cr = '17');
DELETE FROM cr_spell_slots WHERE challange_rating_spell_slots = (SELECT id FROM challange_ratings WHERE cr = '18');
DELETE FROM cr_spell_slots WHERE challange_rating_spell_slots = (SELECT id FROM challange_ratings WHERE cr = '19');
DELETE FROM cr_spell_slots WHERE challange_rating_spell_slots = (SELECT id FROM challange_ratings WHERE cr = '20');
DELETE FROM cr_spell_slots WHERE challange_rating_spell_slots = (SELECT id FROM challange_ratings WHERE cr = '21');
DELETE FROM cr_spell_slots WHERE challange_rating_spell_slots = (SELECT id FROM challange_ratings WHERE cr = '22');
DELETE FROM cr_spell_slots WHERE challange_rating_spell_slots = (SELECT id FROM challange_ratings WHERE cr = '23');
DELETE FROM cr_spell_slots WHERE challange_rating_spell_slots = (SELECT id FROM challange_ratings WHERE cr = '24');
DELETE FROM cr_spell_slots WHERE challange_rating_spell_slots = (SELECT id FROM challange_ratings WHERE cr = '25');
DELETE FROM cr_spell_slots WHERE challange_rating_spell_slots = (SELECT id FROM challange_ratings WHERE cr = '26');
DELETE FROM cr_spell_slots WHERE challange_rating_spell_slots = (SELECT id FROM challange_ratings WHERE cr = '27');
DELETE FROM cr_spell_slots WHERE challange_rating_spell_slots = (SELECT id FROM challange_ratings WHERE cr = '28');
DELETE FROM cr_spell_slots WHERE challange_rating_spell_slots = (SELECT id FROM challange_ratings WHERE cr = '29');
DELETE FROM cr_spell_slots WHERE challange_rating_spell_slots = (SELECT id FROM challange_ratings WHERE cr = '30');
-- +goose StatementEnd

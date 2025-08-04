-- +goose Up
-- +goose StatementBegin
-- challange_ratings
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

INSERT INTO challange_ratings (id, cr) VALUES (gen_random_uuid(), '0');
INSERT INTO challange_ratings (id, cr) VALUES (gen_random_uuid(), '1/8');
INSERT INTO challange_ratings (id, cr) VALUES (gen_random_uuid(), '1/4');
INSERT INTO challange_ratings (id, cr) VALUES (gen_random_uuid(), '1/2');
INSERT INTO challange_ratings (id, cr) VALUES (gen_random_uuid(), '1');
INSERT INTO challange_ratings (id, cr) VALUES (gen_random_uuid(), '2');
INSERT INTO challange_ratings (id, cr) VALUES (gen_random_uuid(), '3');
INSERT INTO challange_ratings (id, cr) VALUES (gen_random_uuid(), '4');
INSERT INTO challange_ratings (id, cr) VALUES (gen_random_uuid(), '5');
INSERT INTO challange_ratings (id, cr) VALUES (gen_random_uuid(), '6');
INSERT INTO challange_ratings (id, cr) VALUES (gen_random_uuid(), '7');
INSERT INTO challange_ratings (id, cr) VALUES (gen_random_uuid(), '8');
INSERT INTO challange_ratings (id, cr) VALUES (gen_random_uuid(), '9');
INSERT INTO challange_ratings (id, cr) VALUES (gen_random_uuid(), '10');
INSERT INTO challange_ratings (id, cr) VALUES (gen_random_uuid(), '11');
INSERT INTO challange_ratings (id, cr) VALUES (gen_random_uuid(), '12');
INSERT INTO challange_ratings (id, cr) VALUES (gen_random_uuid(), '13');
INSERT INTO challange_ratings (id, cr) VALUES (gen_random_uuid(), '14');
INSERT INTO challange_ratings (id, cr) VALUES (gen_random_uuid(), '15');
INSERT INTO challange_ratings (id, cr) VALUES (gen_random_uuid(), '16');
INSERT INTO challange_ratings (id, cr) VALUES (gen_random_uuid(), '17');
INSERT INTO challange_ratings (id, cr) VALUES (gen_random_uuid(), '18');
INSERT INTO challange_ratings (id, cr) VALUES (gen_random_uuid(), '19');
INSERT INTO challange_ratings (id, cr) VALUES (gen_random_uuid(), '20');
INSERT INTO challange_ratings (id, cr) VALUES (gen_random_uuid(), '21');
INSERT INTO challange_ratings (id, cr) VALUES (gen_random_uuid(), '22');
INSERT INTO challange_ratings (id, cr) VALUES (gen_random_uuid(), '23');
INSERT INTO challange_ratings (id, cr) VALUES (gen_random_uuid(), '24');
INSERT INTO challange_ratings (id, cr) VALUES (gen_random_uuid(), '25');
INSERT INTO challange_ratings (id, cr) VALUES (gen_random_uuid(), '26');
INSERT INTO challange_ratings (id, cr) VALUES (gen_random_uuid(), '27');
INSERT INTO challange_ratings (id, cr) VALUES (gen_random_uuid(), '28');
INSERT INTO challange_ratings (id, cr) VALUES (gen_random_uuid(), '29');
INSERT INTO challange_ratings (id, cr) VALUES (gen_random_uuid(), '30');
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
-- challange_ratings
DELETE FROM challange_ratings WHERE cr = '0';
DELETE FROM challange_ratings WHERE cr = '1/8';
DELETE FROM challange_ratings WHERE cr = '1/4';
DELETE FROM challange_ratings WHERE cr = '1/2';
DELETE FROM challange_ratings WHERE cr = '1';
DELETE FROM challange_ratings WHERE cr = '2';
DELETE FROM challange_ratings WHERE cr = '3';
DELETE FROM challange_ratings WHERE cr = '4';
DELETE FROM challange_ratings WHERE cr = '5';
DELETE FROM challange_ratings WHERE cr = '6';
DELETE FROM challange_ratings WHERE cr = '7';
DELETE FROM challange_ratings WHERE cr = '8';
DELETE FROM challange_ratings WHERE cr = '9';
DELETE FROM challange_ratings WHERE cr = '10';
DELETE FROM challange_ratings WHERE cr = '11';
DELETE FROM challange_ratings WHERE cr = '12';
DELETE FROM challange_ratings WHERE cr = '13';
DELETE FROM challange_ratings WHERE cr = '14';
DELETE FROM challange_ratings WHERE cr = '15';
DELETE FROM challange_ratings WHERE cr = '16';
DELETE FROM challange_ratings WHERE cr = '17';
DELETE FROM challange_ratings WHERE cr = '18';
DELETE FROM challange_ratings WHERE cr = '19';
DELETE FROM challange_ratings WHERE cr = '20';
DELETE FROM challange_ratings WHERE cr = '21';
DELETE FROM challange_ratings WHERE cr = '22';
DELETE FROM challange_ratings WHERE cr = '23';
DELETE FROM challange_ratings WHERE cr = '24';
DELETE FROM challange_ratings WHERE cr = '25';
DELETE FROM challange_ratings WHERE cr = '26';
DELETE FROM challange_ratings WHERE cr = '27';
DELETE FROM challange_ratings WHERE cr = '28';
DELETE FROM challange_ratings WHERE cr = '29';
DELETE FROM challange_ratings WHERE cr = '30';
-- +goose StatementEnd

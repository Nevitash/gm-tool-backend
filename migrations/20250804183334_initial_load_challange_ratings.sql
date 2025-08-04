-- +goose Up
-- +goose StatementBegin
-- challange_ratings - Full insert with id, cr, and exp data
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

INSERT INTO challange_ratings (id, cr, exp) VALUES (gen_random_uuid(), '0', 10);
INSERT INTO challange_ratings (id, cr, exp) VALUES (gen_random_uuid(), '1/8', 25);
INSERT INTO challange_ratings (id, cr, exp) VALUES (gen_random_uuid(), '1/4', 50);
INSERT INTO challange_ratings (id, cr, exp) VALUES (gen_random_uuid(), '1/2', 100);
INSERT INTO challange_ratings (id, cr, exp) VALUES (gen_random_uuid(), '1', 200);
INSERT INTO challange_ratings (id, cr, exp) VALUES (gen_random_uuid(), '2', 450);
INSERT INTO challange_ratings (id, cr, exp) VALUES (gen_random_uuid(), '3', 700);
INSERT INTO challange_ratings (id, cr, exp) VALUES (gen_random_uuid(), '4', 1100);
INSERT INTO challange_ratings (id, cr, exp) VALUES (gen_random_uuid(), '5', 1800);
INSERT INTO challange_ratings (id, cr, exp) VALUES (gen_random_uuid(), '6', 2300);
INSERT INTO challange_ratings (id, cr, exp) VALUES (gen_random_uuid(), '7', 2900);
INSERT INTO challange_ratings (id, cr, exp) VALUES (gen_random_uuid(), '8', 3900);
INSERT INTO challange_ratings (id, cr, exp) VALUES (gen_random_uuid(), '9', 5000);
INSERT INTO challange_ratings (id, cr, exp) VALUES (gen_random_uuid(), '10', 5900);
INSERT INTO challange_ratings (id, cr, exp) VALUES (gen_random_uuid(), '11', 7200);
INSERT INTO challange_ratings (id, cr, exp) VALUES (gen_random_uuid(), '12', 8400);
INSERT INTO challange_ratings (id, cr, exp) VALUES (gen_random_uuid(), '13', 10000);
INSERT INTO challange_ratings (id, cr, exp) VALUES (gen_random_uuid(), '14', 11500);
INSERT INTO challange_ratings (id, cr, exp) VALUES (gen_random_uuid(), '15', 13000);
INSERT INTO challange_ratings (id, cr, exp) VALUES (gen_random_uuid(), '16', 15000);
INSERT INTO challange_ratings (id, cr, exp) VALUES (gen_random_uuid(), '17', 18000);
INSERT INTO challange_ratings (id, cr, exp) VALUES (gen_random_uuid(), '18', 20000);
INSERT INTO challange_ratings (id, cr, exp) VALUES (gen_random_uuid(), '19', 22000);
INSERT INTO challange_ratings (id, cr, exp) VALUES (gen_random_uuid(), '20', 25000);
INSERT INTO challange_ratings (id, cr, exp) VALUES (gen_random_uuid(), '21', 33000);
INSERT INTO challange_ratings (id, cr, exp) VALUES (gen_random_uuid(), '22', 41000);
INSERT INTO challange_ratings (id, cr, exp) VALUES (gen_random_uuid(), '23', 50000);
INSERT INTO challange_ratings (id, cr, exp) VALUES (gen_random_uuid(), '24', 62000);
INSERT INTO challange_ratings (id, cr, exp) VALUES (gen_random_uuid(), '25', 75000);
INSERT INTO challange_ratings (id, cr, exp) VALUES (gen_random_uuid(), '26', 90000);
INSERT INTO challange_ratings (id, cr, exp) VALUES (gen_random_uuid(), '27', 105000);
INSERT INTO challange_ratings (id, cr, exp) VALUES (gen_random_uuid(), '28', 120000);
INSERT INTO challange_ratings (id, cr, exp) VALUES (gen_random_uuid(), '29', 135000);
INSERT INTO challange_ratings (id, cr, exp) VALUES (gen_random_uuid(), '30', 155000);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
-- challange_ratings - Delete all inserted data
DELETE FROM challange_ratings WHERE cr IN (
    '0', '1/8', '1/4', '1/2', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
    '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23',
    '24', '25', '26', '27', '28', '29', '30'
);
-- +goose StatementEnd

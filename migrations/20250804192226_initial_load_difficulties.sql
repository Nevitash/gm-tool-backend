-- +goose Up
-- +goose StatementBegin
-- difficulty_levels - Insert data
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

INSERT INTO difficulties (id, name) VALUES (gen_random_uuid(), 'easy');
INSERT INTO difficulties (id, name) VALUES (gen_random_uuid(), 'medium');
INSERT INTO difficulties (id, name) VALUES (gen_random_uuid(), 'hard');
INSERT INTO difficulties (id, name) VALUES (gen_random_uuid(), 'deadly');
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
-- difficulty_levels - Delete data
DELETE FROM difficulties WHERE name IN ('easy', 'medium', 'hard', 'deadly');
-- +goose StatementEnd

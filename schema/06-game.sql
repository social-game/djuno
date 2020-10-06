CREATE TABLE game
(
    id                      SERIAL PRIMARY KEY,
    post_id                 TEXT                        NOT NULL UNIQUE REFERENCES post (id),
    question                TEXT                        NOT NULL,
    end_date                TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    allows_multiple_answers boolean                     NOT NULL,
    allows_answer_edits     boolean                     NOT NULL
);

CREATE TABLE game_answer
(
    game_id     INTEGER NOT NULL REFERENCES game (id),
    answer_id   INTEGER NOT NULL,
    answer_text TEXT    NOT NULL,
    CONSTRAINT game_answer_unique UNIQUE (game_id, answer_id)
);

CREATE TABLE user_game_answer
(
    game_id          INTEGER NOT NULL REFERENCES game (id),
    answer           INTEGER NOT NULL,
    answerer_address TEXT    NOT NULL REFERENCES profile (address)
);

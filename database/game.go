package database

import (
	poststypes "github.com/desmos-labs/desmos/x/posts/types"
)

func (db DesmosDb) SaveGameData(postID poststypes.PostID, game *poststypes.GameData) error {
	// Nil data, do nothing
	if game == nil {
		return nil
	}

	// Saving the game data
	var gameID *uint64
	stmt := `INSERT INTO game (post_id, question, end_date, allows_multiple_answers, allows_answer_edits)
			 VALUES ($1, $2, $3, $4, $5)
			 RETURNING id`

	err := db.Sql.QueryRow(stmt,
		postID.String(), game.Question, game.EndDate, game.AllowsMultipleAnswers, game.AllowsAnswerEdits,
	).Scan(&gameID)
	if err != nil {
		return err
	}

	stmt = `INSERT INTO game_answer(game_id, answer_id, answer_text)
			VALUES($1, $2, $3)
			ON CONFLICT ON CONSTRAINT answer_unique DO NOTHING`

	for _, answer := range game.ProvidedAnswers {
		_, err = db.Sql.Exec(stmt, gameID, answer.ID, answer.Text)
		if err != nil {
			return err
		}
	}

	return nil
}

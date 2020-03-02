package handlers

import (
	"github.com/desmos-labs/desmos/x/posts"
	"github.com/desmos-labs/juno/db/postgresql"
)

func handleMsgAnswerPoll(msg posts.MsgAnswerPoll, db postgresql.Database) error {
	var id uint64

	addPollAnswersSqlStatement := `
	INSERT INTO poll_answers (id, answers, user)
	VALUES ($1, $2, $3)
	RETURNING id;
	`

	err := db.Sql.QueryRow(
		addPollAnswersSqlStatement,
		msg.PostID,
		msg.UserAnswers,
		msg.Answerer,
	).Scan(&id)

	if err != nil {
		return err
	}

	return nil
}
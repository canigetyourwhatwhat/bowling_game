# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     BowlingGame.Repo.insert!(%BowlingGame.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias BowlingGame.{User, Repo}
import Ecto.Query, only: [from: 2]

[%{username: "player1", score: 0, turn: 1}, %{username: "player2", completed: true, score: 123, turn: 10}]
|> Enum.map(fn user_data -> User.changeset(%User{}, user_data) end)
|> Enum.each(fn changeset -> Repo.insert!(changeset) end)

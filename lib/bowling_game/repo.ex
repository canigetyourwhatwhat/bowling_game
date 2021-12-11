defmodule BowlingGame.Repo do
  use Ecto.Repo,
    otp_app: :bowling_game,
    adapter: Ecto.Adapters.Postgres
end

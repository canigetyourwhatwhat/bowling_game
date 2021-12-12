defmodule BowlingGame.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :username, :string
      add :completed, :boolean
      add :score, :integer
      add :turn, :integer

      timestamps()
    end
  end
end

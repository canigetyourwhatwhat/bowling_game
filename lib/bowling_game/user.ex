defmodule BowlingGame.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user" do
    field :username, :string
    field :completed, :boolean, default: false
    field :score, :integer
    field :turn, :integer

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :completed, :score, :turn])
    |> validate_required([])
  end
end

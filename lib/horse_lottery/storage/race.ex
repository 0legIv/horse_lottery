defmodule HorseLottery.Storage.Race do
  use Ecto.Schema
  import Ecto.Changeset

  schema "races" do
    field :horses_allowed, :integer
    field :horses_ids, {:array, :integer}
    field :length, :integer
    field :location, :string
    field :lottery_horses, :integer
    field :name, :string
    field :weather, :string

    timestamps()
  end

  @doc false
  def changeset(race, attrs) do
    race
    |> cast(attrs, [:horses_allowed, :horses_ids, :length, :location, :lottery_horses, :name, :weather])
    |> validate_required([:horses_allowed, :horses_ids, :length, :location, :lottery_horses, :name, :weather])
  end
end

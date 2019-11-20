defmodule HorseLottery.Storage.Race do
  use Ecto.Schema
  import Ecto.Changeset

  schema "races" do
    field :horses_allowed, :integer
    field :length, :integer
    field :location, :string
    field :lottery_horses, :integer
    field :name, :string
    field :weather, :string
    field :rating, :integer

    has_many(:horses, HorseLottery.Storage.Horse)
    timestamps()
  end

  @doc false
  def changeset(race, attrs) do
    race
    |> cast(attrs, [:horses_allowed, :length, :location, :lottery_horses, :name, :weather, :rating])
    |> validate_required([:horses_allowed, :length, :location, :lottery_horses, :name, :weather])
  end
end

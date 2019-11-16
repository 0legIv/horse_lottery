defmodule HorseLottery.Storage.Horse do
  use Ecto.Schema
  import Ecto.Changeset

  schema "horses" do
    field :colour, :string
    field :genotype, :string
    field :lottery, :boolean, default: false
    field :name, :string
    field :rating, :integer

    timestamps()
  end

  @doc false
  def changeset(horse, attrs) do
    horse
    |> cast(attrs, [:colour, :genotype, :lottery, :name, :rating])
    |> validate_required([:colour, :genotype, :lottery, :name, :rating])
  end
end

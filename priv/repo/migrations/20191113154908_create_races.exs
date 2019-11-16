defmodule HorseLottery.Repo.Migrations.CreateRaces do
  use Ecto.Migration

  def change do
    create table(:races) do
      add :horses_allowed, :integer
      add :horses_ids, {:array, :integer}
      add :length, :integer
      add :location, :text
      add :lottery_horses, :integer
      add :name, :text
      add :weather, :text

      timestamps()
    end

  end
end

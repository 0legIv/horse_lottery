defmodule HorseLottery.Repo.Migrations.CreateHorsesTable do
  use Ecto.Migration

  def change do
    create table :horses do
      add(:colour, :text)
      add(:genotype, :text)
      add(:lottery, :boolean)
      add(:name, :text)
      add(:rating, :integer)

      timestamps()
    end
  end
end

# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     HorseLottery.Repo.insert!(%HorseLottery.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
{:ok, file} = File.read("priv/repo/2000_horses.json")
{:ok, horses} = Jason.decode(file)
for horse <- horses, do: HorseLottery.Storage.create_horse(horse)

{:ok, file} = File.read("priv/repo/races.json")
{:ok, races} = Jason.decode(file)
for race <- races, do: race |> Map.delete(:horses_ids) |> HorseLottery.Storage.create_race()

HorseLottery.RaceDistributor.distribute_horses()
defmodule HorseLottery.RaceDistributor do
  alias HorseLottery.Storage

  def distribute_horses() do
    horses = Storage.get_horses_for_distribution()
    races = Storage.list_races()

    Enum.map(races, fn race -> 
      race_horses = Enum.take_random(horses, race.horses_allowed)
      common_rating = calc_common_rating(race_horses)
      Enum.map(race_horses, fn horse -> 
        horse_for_update = Storage.get_horse!(horse.id)
        Storage.update_horse(horse_for_update, %{race_id: race.id}) 
      end)
      Storage.update_race(race, %{rating: common_rating})
    end)
  end

  def calc_common_rating(horses) do
    rating_groups = Enum.group_by(horses, fn horse -> horse.rating end)
    {common_rating, _} = Enum.max_by(rating_groups, fn {_key, value} -> length(value) end)
    common_rating 
  end

  def lottery(races) do
    Enum.map(races, fn race ->
      horses = 
      race
      |> Storage.get_horses_for_race()
      |> choose_lottery_horses()

      Map.put(race, :horses, horses)
    end)
  end

  defp choose_lottery_horses(race) do
    Enum.filter(race.horses, fn horse -> 
      horse.rating >= race.rating - 2 && horse.rating <= race.rating + 2
    end)
  end
end
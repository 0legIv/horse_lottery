defmodule HorseLottery.StorageTest do
  use HorseLottery.DataCase

  alias HorseLottery.Storage

  describe "horses" do
    alias HorseLottery.Storage.Horse

    @valid_attrs %{horses_allowed: 42, horses_ids: [], length: 42, location: "some location", lottery_horses: 42, name: "some name", weather: "some weather"}
    @update_attrs %{horses_allowed: 43, horses_ids: [], length: 43, location: "some updated location", lottery_horses: 43, name: "some updated name", weather: "some updated weather"}
    @invalid_attrs %{horses_allowed: nil, horses_ids: nil, length: nil, location: nil, lottery_horses: nil, name: nil, weather: nil}

    def horse_fixture(attrs \\ %{}) do
      {:ok, horse} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Storage.create_horse()

      horse
    end

    test "list_horses/0 returns all horses" do
      horse = horse_fixture()
      assert Storage.list_horses() == [horse]
    end

    test "get_horse!/1 returns the horse with given id" do
      horse = horse_fixture()
      assert Storage.get_horse!(horse.id) == horse
    end

    test "create_horse/1 with valid data creates a horse" do
      assert {:ok, %Horse{} = horse} = Storage.create_horse(@valid_attrs)
      assert horse.horses_allowed == 42
      assert horse.horses_ids == []
      assert horse.length == 42
      assert horse.location == "some location"
      assert horse.lottery_horses == 42
      assert horse.name == "some name"
      assert horse.weather == "some weather"
    end

    test "create_horse/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Storage.create_horse(@invalid_attrs)
    end

    test "update_horse/2 with valid data updates the horse" do
      horse = horse_fixture()
      assert {:ok, %Horse{} = horse} = Storage.update_horse(horse, @update_attrs)
      assert horse.horses_allowed == 43
      assert horse.horses_ids == []
      assert horse.length == 43
      assert horse.location == "some updated location"
      assert horse.lottery_horses == 43
      assert horse.name == "some updated name"
      assert horse.weather == "some updated weather"
    end

    test "update_horse/2 with invalid data returns error changeset" do
      horse = horse_fixture()
      assert {:error, %Ecto.Changeset{}} = Storage.update_horse(horse, @invalid_attrs)
      assert horse == Storage.get_horse!(horse.id)
    end

    test "delete_horse/1 deletes the horse" do
      horse = horse_fixture()
      assert {:ok, %Horse{}} = Storage.delete_horse(horse)
      assert_raise Ecto.NoResultsError, fn -> Storage.get_horse!(horse.id) end
    end

    test "change_horse/1 returns a horse changeset" do
      horse = horse_fixture()
      assert %Ecto.Changeset{} = Storage.change_horse(horse)
    end
  end

  describe "races" do
    alias HorseLottery.Storage.Race

    @valid_attrs %{horses_allowed: 42, horses_ids: [], length: 42, location: "some location", lottery_horses: 42, name: "some name", weather: "some weather"}
    @update_attrs %{horses_allowed: 43, horses_ids: [], length: 43, location: "some updated location", lottery_horses: 43, name: "some updated name", weather: "some updated weather"}
    @invalid_attrs %{horses_allowed: nil, horses_ids: nil, length: nil, location: nil, lottery_horses: nil, name: nil, weather: nil}

    def race_fixture(attrs \\ %{}) do
      {:ok, race} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Storage.create_race()

      race
    end

    test "list_races/0 returns all races" do
      race = race_fixture()
      assert Storage.list_races() == [race]
    end

    test "get_race!/1 returns the race with given id" do
      race = race_fixture()
      assert Storage.get_race!(race.id) == race
    end

    test "create_race/1 with valid data creates a race" do
      assert {:ok, %Race{} = race} = Storage.create_race(@valid_attrs)
      assert race.horses_allowed == 42
      assert race.horses_ids == []
      assert race.length == 42
      assert race.location == "some location"
      assert race.lottery_horses == 42
      assert race.name == "some name"
      assert race.weather == "some weather"
    end

    test "create_race/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Storage.create_race(@invalid_attrs)
    end

    test "update_race/2 with valid data updates the race" do
      race = race_fixture()
      assert {:ok, %Race{} = race} = Storage.update_race(race, @update_attrs)
      assert race.horses_allowed == 43
      assert race.horses_ids == []
      assert race.length == 43
      assert race.location == "some updated location"
      assert race.lottery_horses == 43
      assert race.name == "some updated name"
      assert race.weather == "some updated weather"
    end

    test "update_race/2 with invalid data returns error changeset" do
      race = race_fixture()
      assert {:error, %Ecto.Changeset{}} = Storage.update_race(race, @invalid_attrs)
      assert race == Storage.get_race!(race.id)
    end

    test "delete_race/1 deletes the race" do
      race = race_fixture()
      assert {:ok, %Race{}} = Storage.delete_race(race)
      assert_raise Ecto.NoResultsError, fn -> Storage.get_race!(race.id) end
    end

    test "change_race/1 returns a race changeset" do
      race = race_fixture()
      assert %Ecto.Changeset{} = Storage.change_race(race)
    end
  end

  describe "horses" do
    alias HorseLottery.Storage.Horse

    @valid_attrs %{colour: "some colour", genotype: "some genotype", lottery: true, name: "some name", rating: 42}
    @update_attrs %{colour: "some updated colour", genotype: "some updated genotype", lottery: false, name: "some updated name", rating: 43}
    @invalid_attrs %{colour: nil, genotype: nil, lottery: nil, name: nil, rating: nil}

    def horse_fixture(attrs \\ %{}) do
      {:ok, horse} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Storage.create_horse()

      horse
    end

    test "list_horses/0 returns all horses" do
      horse = horse_fixture()
      assert Storage.list_horses() == [horse]
    end

    test "get_horse!/1 returns the horse with given id" do
      horse = horse_fixture()
      assert Storage.get_horse!(horse.id) == horse
    end

    test "create_horse/1 with valid data creates a horse" do
      assert {:ok, %Horse{} = horse} = Storage.create_horse(@valid_attrs)
      assert horse.colour == "some colour"
      assert horse.genotype == "some genotype"
      assert horse.lottery == true
      assert horse.name == "some name"
      assert horse.rating == 42
    end

    test "create_horse/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Storage.create_horse(@invalid_attrs)
    end

    test "update_horse/2 with valid data updates the horse" do
      horse = horse_fixture()
      assert {:ok, %Horse{} = horse} = Storage.update_horse(horse, @update_attrs)
      assert horse.colour == "some updated colour"
      assert horse.genotype == "some updated genotype"
      assert horse.lottery == false
      assert horse.name == "some updated name"
      assert horse.rating == 43
    end

    test "update_horse/2 with invalid data returns error changeset" do
      horse = horse_fixture()
      assert {:error, %Ecto.Changeset{}} = Storage.update_horse(horse, @invalid_attrs)
      assert horse == Storage.get_horse!(horse.id)
    end

    test "delete_horse/1 deletes the horse" do
      horse = horse_fixture()
      assert {:ok, %Horse{}} = Storage.delete_horse(horse)
      assert_raise Ecto.NoResultsError, fn -> Storage.get_horse!(horse.id) end
    end

    test "change_horse/1 returns a horse changeset" do
      horse = horse_fixture()
      assert %Ecto.Changeset{} = Storage.change_horse(horse)
    end
  end
end

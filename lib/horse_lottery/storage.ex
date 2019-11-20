defmodule HorseLottery.Storage do
  @moduledoc """
  The Storage context.
  """

  import Ecto.Query, warn: false
  alias HorseLottery.Repo

  alias HorseLottery.Storage.Race

  @doc """
  Returns the list of races.

  ## Examples

      iex> list_races()
      [%Race{}, ...]

  """
  def list_races do
    Repo.all(Race)
  end

  @doc """
  Gets a single race.

  Raises `Ecto.NoResultsError` if the Race does not exist.

  ## Examples

      iex> get_race!(123)
      %Race{}

      iex> get_race!(456)
      ** (Ecto.NoResultsError)

  """
  def get_race!(id) do 
    Repo.get!(Race, id) |> Repo.preload(:horses)
  end

  def get_horses_for_race(race) do
    Repo.preload(race, :horses)
  end

  @doc """
  Creates a race.

  ## Examples

      iex> create_race(%{field: value})
      {:ok, %Race{}}

      iex> create_race(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_race(attrs \\ %{}) do
    %Race{}
    |> Race.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a race.

  ## Examples

      iex> update_race(race, %{field: new_value})
      {:ok, %Race{}}

      iex> update_race(race, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_race(%Race{} = race, attrs) do
    race
    |> Race.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Race.

  ## Examples

      iex> delete_race(race)
      {:ok, %Race{}}

      iex> delete_race(race)
      {:error, %Ecto.Changeset{}}

  """
  def delete_race(%Race{} = race) do
    Repo.delete(race)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking race changes.

  ## Examples

      iex> change_race(race)
      %Ecto.Changeset{source: %Race{}}

  """
  def change_race(%Race{} = race) do
    Race.changeset(race, %{})
  end

  alias HorseLottery.Storage.Horse

  @doc """
  Returns the list of horses.

  ## Examples

      iex> list_horses()
      [%Horse{}, ...]

  """
  def list_horses do
    Repo.all(Horse)
  end

  def get_horses_for_distribution() do
    from(h in Horse, select: %{id: h.id, rating: h.rating}) |> Repo.all
  end

  @doc """
  Gets a single horse.

  Raises `Ecto.NoResultsError` if the Horse does not exist.

  ## Examples

      iex> get_horse!(123)
      %Horse{}

      iex> get_horse!(456)
      ** (Ecto.NoResultsError)

  """
  def get_horse!(id), do: Repo.get!(Horse, id)

  @doc """
  Creates a horse.

  ## Examples

      iex> create_horse(%{field: value})
      {:ok, %Horse{}}

      iex> create_horse(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_horse(attrs \\ %{}) do
    %Horse{}
    |> Horse.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a horse.

  ## Examples

      iex> update_horse(horse, %{field: new_value})
      {:ok, %Horse{}}

      iex> update_horse(horse, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_horse(%Horse{} = horse, attrs) do
    horse
    |> Horse.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Horse.

  ## Examples

      iex> delete_horse(horse)
      {:ok, %Horse{}}

      iex> delete_horse(horse)
      {:error, %Ecto.Changeset{}}

  """
  def delete_horse(%Horse{} = horse) do
    Repo.delete(horse)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking horse changes.

  ## Examples

      iex> change_horse(horse)
      %Ecto.Changeset{source: %Horse{}}

  """
  def change_horse(%Horse{} = horse) do
    Horse.changeset(horse, %{})
  end
end

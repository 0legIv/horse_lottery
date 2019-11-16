defmodule HorseLotteryWeb.HorseController do
  use HorseLotteryWeb, :controller

  alias HorseLottery.Storage
  alias HorseLottery.Storage.Horse

  def index(conn, _params) do
    horses = Storage.list_horses()
    render(conn, "index.html", horses: horses)
  end

  def new(conn, _params) do
    changeset = Storage.change_horse(%Horse{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"horse" => horse_params}) do
    case Storage.create_horse(horse_params) do
      {:ok, horse} ->
        conn
        |> put_flash(:info, "Horse created successfully.")
        |> redirect(to: Routes.horse_path(conn, :show, horse))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    horse = Storage.get_horse!(id)
    render(conn, "show.html", horse: horse)
  end

  def edit(conn, %{"id" => id}) do
    horse = Storage.get_horse!(id)
    changeset = Storage.change_horse(horse)
    render(conn, "edit.html", horse: horse, changeset: changeset)
  end

  def update(conn, %{"id" => id, "horse" => horse_params}) do
    horse = Storage.get_horse!(id)

    case Storage.update_horse(horse, horse_params) do
      {:ok, horse} ->
        conn
        |> put_flash(:info, "Horse updated successfully.")
        |> redirect(to: Routes.horse_path(conn, :show, horse))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", horse: horse, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    horse = Storage.get_horse!(id)
    {:ok, _horse} = Storage.delete_horse(horse)

    conn
    |> put_flash(:info, "Horse deleted successfully.")
    |> redirect(to: Routes.horse_path(conn, :index))
  end
end

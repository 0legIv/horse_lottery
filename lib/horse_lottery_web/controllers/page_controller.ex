defmodule HorseLotteryWeb.PageController do
  use HorseLotteryWeb, :controller

  def index(conn, _params) do
    conn 
    |> redirect(to: Routes.race_path(conn, :index))
  end
end

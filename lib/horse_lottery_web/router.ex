defmodule HorseLotteryWeb.Router do
  use HorseLotteryWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HorseLotteryWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/races", RaceController, only: [:index, :show]
    get "/lottery", RaceController, :lottery
    resources "/horses", HorseController
  end

  # Other scopes may use custom stacks.
  # scope "/api", HorseLotteryWeb do
  #   pipe_through :api
  # end
end

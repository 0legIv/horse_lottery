# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :horse_lottery,
  ecto_repos: [HorseLottery.Repo]

# Configures the endpoint
config :horse_lottery, HorseLotteryWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Nc5JxnJhY9dVLaige+xOLi771DXB89sC+fyG7sMZNL+3/2cf6r2evXuzSVzpZUxD",
  render_errors: [view: HorseLotteryWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: HorseLottery.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

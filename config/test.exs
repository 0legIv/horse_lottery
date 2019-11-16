use Mix.Config

# Configure your database
config :horse_lottery, HorseLottery.Repo,
  username: "postgres",
  password: "postgres",
  database: "horse_lottery_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :horse_lottery, HorseLotteryWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

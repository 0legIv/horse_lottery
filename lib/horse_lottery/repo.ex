defmodule HorseLottery.Repo do
  use Ecto.Repo,
    otp_app: :horse_lottery,
    adapter: Ecto.Adapters.Postgres
end

defmodule Brewery.Repo do
  use Ecto.Repo,
    otp_app: :brewery,
    adapter: Ecto.Adapters.Postgres
end

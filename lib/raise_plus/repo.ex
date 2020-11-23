defmodule RaisePlus.Repo do
  use Ecto.Repo,
    otp_app: :raise_plus,
    adapter: Ecto.Adapters.Postgres
end

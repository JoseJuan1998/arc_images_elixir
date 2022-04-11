defmodule Imageer.Repo do
  use Ecto.Repo,
    otp_app: :imageer,
    adapter: Ecto.Adapters.Postgres
end

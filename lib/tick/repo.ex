defmodule Tick.Repo do
  use Ecto.Repo,
    otp_app: :tick,
    adapter: Ecto.Adapters.Postgres
end

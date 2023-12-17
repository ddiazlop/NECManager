defmodule Necmanager.Repo do
  use Ecto.Repo,
    otp_app: :necmanager,
    adapter: Ecto.Adapters.Postgres
end

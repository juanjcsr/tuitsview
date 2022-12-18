defmodule Tuitsview.Repo do
  use Ecto.Repo,
    otp_app: :tuitsview,
    adapter: Ecto.Adapters.Postgres
end

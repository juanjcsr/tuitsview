defmodule Tuitsview.TuitsRepo do
  use Ecto.Repo,
    otp_app: :tuitsview,
    adapter: Ecto.Adapters.Postgres
end

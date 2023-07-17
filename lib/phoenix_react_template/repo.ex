defmodule PhoenixReactTemplate.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_react_template,
    adapter: Ecto.Adapters.Postgres
end

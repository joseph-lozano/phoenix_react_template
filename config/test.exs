import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :phoenix_react_template, PhoenixReactTemplate.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "phoenix_react_template_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_react_template, PhoenixReactTemplateWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "ei00QTWhPf04ueHQInOrMWkZ3eZUrlvSDwuJ6EIpjG83bvjPpS2jQJu5y54ETCrw",
  server: false

# In test we don't send emails.
config :phoenix_react_template, PhoenixReactTemplate.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

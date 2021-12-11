import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :bowling_game, BowlingGame.Repo,
  username: "postgres",
  password: "postgres",
  database: "bowling_game_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :bowling_game, BowlingGameWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "Dy2hw7IH0FUG46u98wG6Sfv7Deslp2K6fArL5AV072xC5et0d69tQBWRPDP9ekbg",
  server: false

# In test we don't send emails.
config :bowling_game, BowlingGame.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

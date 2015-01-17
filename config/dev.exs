use Mix.Config

config :chatter, Chatter.Endpoint,
  http: [port: System.get_env("PORT") || 4000],
  debug_errors: true

# Enables code reloading for development
config :phoenix, :code_reloader, true

# "ecto://localhost/chatter_data_dev"
config :chatter, Data,
      database: "chatter_data_dev",
      hostname: "localhost"

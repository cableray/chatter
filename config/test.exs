use Mix.Config

config :chatter, Chatter.Endpoint,
  http: [port: System.get_env("PORT") || 4001],
  catch_errors: false

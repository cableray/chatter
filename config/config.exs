# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the router
config :chatter, Chatter.Endpoint,
  url: [host: "localhost"],
  http: [port: System.get_env("PORT")],
  https: false,
  secret_key_base: "tDfLiQVF9zosHq3sUgzYEIKVBoQ9Pwj2FU06IdeXgbIX4L/cLG0YE8IW5l4d/lw8VPvCWLJ3qpAlFOMDaGxIJw==",
  catch_errors: true,
  debug_errors: false,
  error_controller: Chatter.PageController

# Session configuration
config :chatter, Chatter.Endpoint,
  session: [store: :cookie,
            key: "_chatter_key"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

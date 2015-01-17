defmodule Chatter.Endpoint do
  use Phoenix.Endpoint, otp_app: :chatter

  plug Plug.Static,
    at: "/", from: :chatter

  plug Plug.Logger

  # Code reloading will only work if the :code_reloader key of
  # the :phoenix application is set to true in your config file.
  plug Phoenix.CodeReloader

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_chatter_key",
    signing_salt: "test",
    encryption_salt: "also_test"

  plug :router, Chatter.Router
end
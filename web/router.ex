defmodule Chatter.Router do
  use Phoenix.Router

  scope "/" do
    # Use the default browser stack.
    pipe_through :browser

    get "/", Chatter.PageController, :index, as: :pages
    get "/topics", Chatter.TopicsController, :index, as: :topics
    get "/topics/:topic", Chatter.TopicsController, :show, as: :topic
  end

  # Other scopes may use custom stacks.
  # scope "/api" do
  #   pipe_through :api
  # end

  use Phoenix.Router.Socket, mount: "/sockets"

  channel "broadcast", Chatter.BroadcastChannel
end

defmodule Chatter.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ~w(html)
    plug :fetch_session
    plug :fetch_flash
  end

  pipeline :api do
    plug :accepts, ~w(json)
  end

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

  socket "/sockets", Chatter do
    channel "broadcast:*", BroadcastChannel    # match any topic starting with "broadcast:"
  end
end

defmodule Chatter.TopicsController do
  use Phoenix.Controller
  import Ecto.Query, only: [from: 2]

  plug :action

  def index(conn, _params) do
    topics = Data.all(
      from m in Chatter.Message,
      group_by: m.topic,
      select: m.topic
    )
    render conn, "index", topics: topics
  end

  def show(conn, %{"topic" => topic}) do
    render conn, "show", topic: URI.decode(topic)
  end

  def not_found(conn, _params) do
    render conn, "not_found"
  end

  def error(conn, _params) do
    render conn, "error"
  end
end

defmodule Chatter.BroadcastChannel do
  use Phoenix.Channel
  import Ecto.Query, only: [from: 2]

  def join(socket, topic, message) do
    sender_name = Dict.get(message, "sender_name")
    socket = assign(socket, :sender_name, sender_name)
    messages = Data.all(from m in Chatter.Message, where: m.topic == ^topic)
    Chatter.ActiveUsers.join sender_name
    broadcast socket, "user:joined", %{sender_name: sender_name}
    reply socket, "join", %{messages: messages, active_users: Chatter.ActiveUsers.list}
    {:ok, socket}
  end

  @doc "called when a socket closes"
  def leave(socket, _reason) do
    sender_name = get_assign(socket, :sender_name)
    Chatter.ActiveUsers.leave sender_name
    broadcast socket, "user:left", %{sender_name: sender_name}

    # TODO: Account for multiple sockets opened to the same user
  end

  def event(socket, "send", %{"body" => body}) do
    message = Data.insert(
      %Chatter.Message{
        body: body, 
        topic: socket.topic, 
        sender_name: get_assign(socket, :sender_name)})
    broadcast socket, "receive", message
    socket
  end
end
defmodule Chatter.BroadcastChannel do
  use Phoenix.Channel
  import Ecto.Query, only: [from: 2]

  def join(socket, topic, message) do
    sender_name = Dict.get(message, "sender_name")
    socket = assign(socket, :sender_name, sender_name)
    messages = Data.all(from m in Chatter.Message, where: m.topic == ^topic)
    reply socket, "join", %{messages: messages}
    {:ok, socket}
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

  def event(socket, "leave", _meassage) do
    socket
  end
end
defmodule Chatter.BroadcastChannel do
  use Phoenix.Channel
  import Ecto.Query, only: [from: 2]

  def join(socket, topic, _message) do
    messages = Data.all(from m in Chatter.Message, where: m.topic == ^topic)
    reply socket, "join", %{messages: messages}
    {:ok, socket}
  end

  def event(socket, "send", %{"body" => body}) do
    message = Data.insert(%Chatter.Message{body: body, topic: socket.topic})
    broadcast socket, "receive", message
    socket
  end
  
end
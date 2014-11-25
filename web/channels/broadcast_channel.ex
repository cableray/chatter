defmodule Chatter.BroadcastChannel do
	use Phoenix.Channel

	def join(socket, "lobby", _message) do
    {:ok, socket}
  end

  def event(socket, "send", %{"body" => body}) do
    message = Data.insert(%Chatter.Message{body: body})
    broadcast socket, "receive", message
    socket
  end
  
end
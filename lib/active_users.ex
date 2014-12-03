defmodule Chatter.ActiveUsers do
	use GenServer

  # TODO: Make active users per topic
  # TODO: Track last activity and other metadata
  # TODO: Tests! This is a good place to start testing. Should make for nice unit tests

  @doc "start up the active users list. optionally pass in a set for the initial state"
  def start_link(state \\ HashSet.new()) do
    GenServer.start_link(__MODULE__, state, [name: __MODULE__])
  end

  @doc "Get a list of all the active users"
  def list() do
    list(__MODULE__, :list)
  end

  def list(pid) do
    GenServer.call(pid, :list)
  end

  @doc "update the active users list with the name of a new user"
  def join(sender_name) do
    join(__MODULE__, sender_name)
  end

  def join(pid, sender_name) do
    GenServer.cast(pid, {:join, sender_name})
  end

  @doc "remove a user from the active users list"
  def leave(sender_name) do
    leave(__MODULE__, sender_name)
  end

  def leave(pid, sender_name) do
    GenServer.cast(pid, {:leave, sender_name})
  end

  def handle_cast({:join, sender_name}, state) do
    {:noreply, Set.put(state, sender_name)}
  end

	def handle_cast({:leave, sender_name}, state) do
    {:noreply, Set.delete(state, sender_name)}
	end

  def handle_call(:list, _from, state) do
    {:reply, Set.to_list(state), state}
  end

end
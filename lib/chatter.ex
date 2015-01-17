defmodule Chatter do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Chatter.Endpoint, []),
      # Define workers and child supervisors to be supervised
      # worker(Chatter.Worker, [arg1, arg2, arg3])
      worker(Data, []),
      worker(Chatter.ActiveUsers, []),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Chatter.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    Chatter.Endpoint.config_change(changed, removed)
    :ok
  end
end

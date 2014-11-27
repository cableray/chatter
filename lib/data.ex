defmodule Data do
  require Logger
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres, env: Mix.env

  @doc "Adapter configuration"
  def conf(env), do: parse_url url(env)

  @doc "The URL to reach the database."
  defp url(:dev) do
    "ecto://localhost/chatter_data_dev"
  end

  defp url(:test) do
    "ecto://user:pass@localhost/chatter_data_test?size=1&max_overflow=0"
  end

  defp url(:prod) do
    "ecto://user:pass@localhost/chatter_data_prod"
  end

  @doc "The priv directory to load migrations and metadata."
  def priv do
    app_dir(:chatter, "priv/data")
  end

  @doc "Log and time queries"
  def log({:query, sql}, fun) do
    {time, result} = :timer.tc(fun)
    Logger.debug("query (completed in #{time}ms): #{sql}")
    result
  end

  def log(_arg, fun), do: fun.()
end

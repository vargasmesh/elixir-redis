defmodule ElixirRedis.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Bandit, scheme: :http, plug: ElixirRedisWeb.Router, port: 8000}
    ]

    opts = [strategy: :one_for_one, name: ElixirRedis.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

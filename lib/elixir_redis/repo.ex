defmodule ElixirRedis.Repo do
  use Ecto.Repo, otp_app: :elixir_redis, adapter: Ecto.Adapters.SQLite3
end

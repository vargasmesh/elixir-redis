import Config

config :elixir_redis,
  ecto_repos: [ElixirRedis.Repo]

config :elixir_redis, ElixirRedis.Repo, database: "db/database.sqlite"

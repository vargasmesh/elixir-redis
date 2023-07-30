defmodule ElixirRedis.Redix do
  def command(command) do
    Redix.command(:redix, command)
  end

  def transaction_pipeline(commands) do
    Redix.transaction_pipeline(:redix, commands)
  end
end

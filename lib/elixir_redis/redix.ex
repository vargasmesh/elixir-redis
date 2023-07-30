defmodule ElixirRedis.Redix do
  def command(command) do
    Redix.command(:redix, command)
  end
end

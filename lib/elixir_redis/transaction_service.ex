defmodule ElixirRedis.TransactionService do
  import Ecto.Query

  alias ElixirRedis.Transaction
  alias ElixirRedis.Repo

  def calculate_total_received_amount(to_hash) do
    query =
      from t in Transaction,
        where: t.to_hash == ^to_hash,
        select: %{total: sum(t.amount)}

    Map.put(Repo.one(query), :calculated_at, DateTime.utc_now())
  end
end

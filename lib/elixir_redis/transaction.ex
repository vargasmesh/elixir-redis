defmodule ElixirRedis.Transaction do
  use Ecto.Schema

  schema "transactions" do
    field :amount, :integer
    field :from_hash, :string
    field :to_hash, :string

    timestamps(updated_at: false)
  end
end

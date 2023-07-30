defmodule ElixirRedis.Repo.Migrations.CreateTransaction do
  use Ecto.Migration

  def change do
    create table(:transactions) do
      add :amount, :integer, null: false
      add :from_hash, :text, null: false
      add :to_hash, :text, null: false

      timestamps(updated_at: false)
    end
  end
end

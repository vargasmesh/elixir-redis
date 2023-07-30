defmodule ElixirRedisWeb.Router do
  use Plug.Router
  alias ElixirRedis.TransactionService
  alias ElixirRedis.Redix

  plug Plug.Parsers,
    parsers: [:json],
    pass: ["*/*"],
    json_decoder: Jason

  plug :match
  plug :dispatch

  get "/total-amount/:hash" do
    response =
      case Redix.command(["JSON.GET", hash]) do
        {:ok, nil} ->
          result = Jason.encode!(TransactionService.calculate_total_received_amount(hash))

          Redix.transaction_pipeline([
            ["JSON.SET", hash, "$", result],
            ["EXPIRE", hash, "60"]
          ])

          result

        {:ok, value} ->
          value
      end

    send_resp(
      conn,
      200,
      response
    )
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end

defmodule ElixirRedisWeb.Router do
  use Plug.Router
  alias ElixirRedis.TransactionService

  plug Plug.Parsers,
    parsers: [:json],
    pass: ["*/*"],
    json_decoder: Jason

  plug :match
  plug :dispatch

  get "/total-amount/:hash" do
    send_resp(
      conn,
      200,
      Jason.encode!(TransactionService.calculate_total_received_amount(hash))
    )
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end

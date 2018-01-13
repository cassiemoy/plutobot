defmodule Plutobot.Router do
  use Plug.Router
  use Plug.Debugger, otp_app: :plutobot

  plug Plug.Logger
  plug Plug.Parsers, parsers: [:json, :urlencoded]
  plug :match
  plug :dispatch

  post "/webhook" do
    send_resp(conn, 200, "hello world")
  end

  match _ do
    send_resp(conn, 404, "not_found")
  end
end

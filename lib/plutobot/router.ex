defmodule Plutobot.Router do
  use Plug.Router
  use Plug.Debugger, otp_app: :plutobot

  plug Plug.Logger
  plug Plug.Parsers, parsers: [:json, :urlencoded]
  plug :match
  plug :dispatch

  post "/webhook" do
    send_resp(conn, 200, ~s({"text":"ok"}))
  end

  match _ do
    send_resp(conn, 404, "Not found.")
  end
end

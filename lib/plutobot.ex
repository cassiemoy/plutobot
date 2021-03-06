defmodule Plutobot do
  use Application

  def start(_type, _args) do
    port = Application.fetch_env!(:plutobot, :port)
    children = [ Plug.Adapters.Cowboy.child_spec(:http, Plutobot.Router, [], port: port) ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end

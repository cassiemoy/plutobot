defmodule PlutobotTest do
  use ExUnit.Case
  use Plug.Test

  doctest Plutobot

  alias Plutobot.Router

  @opts Router.init([])

  test "responds to greeting" do
    conn = conn(:post, "/webhook", "")
           |> Router.call(@opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "hello world"
  end
end

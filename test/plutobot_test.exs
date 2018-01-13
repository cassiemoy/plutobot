defmodule PlutobotTest do
  use ExUnit.Case
  doctest Plutobot

  test "greets the world" do
    assert Plutobot.hello() == :world
  end
end

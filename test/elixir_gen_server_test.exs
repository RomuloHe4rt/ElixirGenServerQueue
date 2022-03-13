defmodule ElixirGenServerTest do
  use ExUnit.Case
  doctest ElixirGenServer

  test "greets the world" do
    assert ElixirGenServer.hello() == :world
  end
end

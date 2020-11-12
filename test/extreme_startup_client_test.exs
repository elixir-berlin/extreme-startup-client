defmodule ExtremeStartupClientTest do
  use ExUnit.Case
  doctest ExtremeStartupClient

  test "greets the world" do
    assert ExtremeStartupClient.hello() == :world
  end
end

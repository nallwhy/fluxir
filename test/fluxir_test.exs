defmodule FluxirTest do
  use ExUnit.Case
  doctest Fluxir

  test "greets the world" do
    assert Fluxir.hello() == :world
  end
end

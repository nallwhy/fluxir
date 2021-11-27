defmodule FluxirTest do
  use ExUnit.Case, async: true

  test "struct" do
    fluxir = %Fluxir{}

    assert fluxir.functions == []
  end
end

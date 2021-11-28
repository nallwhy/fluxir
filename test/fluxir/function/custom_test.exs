defmodule Fluxir.Function.CustomTest do
  use ExUnit.Case, async: true
  alias Fluxir.Function.Custom

  setup do
    %{flux: "anyFunction(key: value)"}
  end

  test "new/1", %{flux: flux} do
    assert %Custom{} = custom = Custom.new(flux)

    assert flux == custom.flux
  end

  test "to_flux/1", %{flux: flux} do
    custom = Custom.new(flux)

    assert ~s/anyFunction(key: value)/ == Custom.to_flux(custom)
  end
end

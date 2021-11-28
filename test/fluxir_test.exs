defmodule FluxirTest do
  use ExUnit.Case, async: true

  test "struct" do
    fluxir = %Fluxir{}

    assert fluxir.functions == []
  end

  test "to_flux/1" do
    test_function0 = Fluxir.TestFunction.new(key: 0)
    test_function1 = Fluxir.TestFunction.new(key: 1)

    assert """
           test(key: 1)
           |> test(key: 0)
           """ ==
             %Fluxir{functions: [test_function0, test_function1]}
             |> Fluxir.to_flux()
  end

  test "from/2" do
    assert %Fluxir{functions: [%Fluxir.Function.Influxdata.Influxdb.From{bucket: "bucket"}]} =
             Fluxir.from(bucket: "bucket")
  end
end

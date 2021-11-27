defmodule Fluxir.FunctionTest do
  defmodule Test do
    @behaviour Fluxir.Function

    @impl true
    def new(_keyword), do: struct(Test, [])

    @impl true
    def to_flux(_struct), do: ""
  end
end

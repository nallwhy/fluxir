defmodule Fluxir.TestFunction do
  defstruct [:key]

  @behaviour Fluxir.Function

  @impl true
  def new(key: value), do: %__MODULE__{key: value}

  @impl true
  def to_flux(%__MODULE__{key: value}), do: "test(key: #{value})"
end

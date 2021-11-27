defmodule Fluxir.Function do
  @doc """
  Create a new Fluxir function.
  """
  @callback new(keyword()) :: struct()

  @doc """
  Convert Fluxir function to Flux string.
  """
  @callback to_flux(struct()) :: String.t()
end

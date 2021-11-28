defmodule Fluxir.Function.Custom do
  @behaviour Fluxir.Function

  @enforce_keys [:flux]
  defstruct @enforce_keys

  @doc false
  @impl true
  def new(flux) do
    struct(__MODULE__, flux: flux)
  end

  @doc false
  @impl true
  def to_flux(%__MODULE__{flux: flux}) do
    flux
  end
end

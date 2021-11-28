defmodule Fluxir do
  defstruct functions: []

  @doc """
  Convert Fluxir functions to Flux string.
  """
  def to_flux(%__MODULE__{functions: functions}) do
    functions
    |> Enum.map(fn function ->
      function.__struct__.to_flux(function)
    end)
    |> Enum.reverse()
    |> Enum.join("\n|> ")
    |> Kernel.<>("\n")
  end

  @doc """
  Append [from()](https://docs.influxdata.com/flux/v0.x/stdlib/influxdata/influxdb/from/) function to Fluxir functions.
  """
  def from(%__MODULE__{functions: functions} = fluxir \\ %__MODULE__{}, params) do
    new_functions = [Fluxir.Function.Influxdata.Influxdb.From.new(params) | functions]
    %__MODULE__{fluxir | functions: new_functions}
  end

  @doc """
  Append custom function to Fluxir functions.

  iex> Fluxir.Custom("anyFunction(key: value)")
  %Fluxir.Function.Custom{flux: "anyFunction(key: value)"}

  """
  def custom(%__MODULE__{functions: functions} = fluxir \\ %__MODULE__{}, flux) do
    new_functions = [Fluxir.Function.Custom.new(flux) | functions]
    %__MODULE__{fluxir | functions: new_functions}
  end
end

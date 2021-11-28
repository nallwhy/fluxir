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
  Build [from()](https://docs.influxdata.com/flux/v0.x/stdlib/influxdata/influxdb/from/) function.
  """
  def from(%__MODULE__{functions: functions} = fluxir \\ %__MODULE__{}, params) do
    new_functions = [Fluxir.Function.Influxdata.Influxdb.From.new(params) | functions]
    %__MODULE__{fluxir | functions: new_functions}
  end
end

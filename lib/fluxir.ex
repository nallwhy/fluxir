defmodule Fluxir do
  defstruct functions: []

  def to_flux(%__MODULE__{functions: functions}) do
    functions
    |> Enum.map(fn function ->
      function.__struct__.to_flux(function)
    end)
    |> Enum.reverse()
    |> Enum.join("\n|> ")
    |> Kernel.<>("\n")
  end
end

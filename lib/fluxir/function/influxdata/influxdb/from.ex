defmodule Fluxir.Function.Influxdata.Influxdb.From do
  @behaviour Fluxir.Function

  @name "from"

  # {name, type}
  @params [
    {:bucket, :string},
    {:bucket_id, :string},
    {:host, :string},
    {:org, :string},
    {:org_id, :string},
    {:token, :string}
  ]

  defstruct @params |> Enum.map(fn {name, _type} -> name end)

  @doc false
  @impl true
  def new(keyword) do
    struct(__MODULE__, keyword)
  end

  @doc false
  @impl true
  def to_flux(%__MODULE__{} = struct) do
    "#{@name}(#{convert_params_to_flux(struct)})"
  end

  defp convert_params_to_flux(%__MODULE__{} = struct) do
    @params
    |> Enum.reduce([], fn {name, type}, acc ->
      case struct |> Map.get(name) do
        nil ->
          acc

        value ->
          key = name |> Fluxir.Util.lower_camelize()
          encoded_value = Fluxir.Encoder.encode(type, value)

          ["#{key}: #{encoded_value}" | acc]
      end
    end)
    |> Enum.reverse()
    |> Enum.join(", ")
  end
end

defmodule Fluxir.Encoder do
  def encode(:string, value) when is_binary(value), do: "\"#{value}\""
end

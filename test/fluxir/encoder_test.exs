defmodule Fluxir.EncoderTest do
  use ExUnit.Case, async: true
  alias Fluxir.Encoder

  test "encode/2" do
    assert ~s("string") = Encoder.encode(:string, "string")
  end
end

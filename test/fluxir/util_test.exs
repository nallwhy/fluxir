defmodule Fluxir.UtilTest do
  use ExUnit.Case, async: true
  alias Fluxir.Util

  test "lower_camelize/1" do
    assert "snakeCaseKey" = Util.lower_camelize(:snake_case_key)
  end
end

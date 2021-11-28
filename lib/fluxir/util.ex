defmodule Fluxir.Util do
  @lower_camelize_regex ~r/(_)([A-Za-z])/
  def lower_camelize(any) do
    string = any |> to_string()

    Regex.replace(@lower_camelize_regex, string, fn _total, _under_bar, next_charactor ->
      String.capitalize(next_charactor)
    end)
  end
end

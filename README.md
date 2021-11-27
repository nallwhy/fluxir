# Fluxir

Fluxir is a [Flux](https://github.com/influxdata/flux) builder for Elixir.

```elixir
iex> (Fluxir.from(bucket: "<bucket>")
|> Fluxir.range(start: "-1d")
|> Fluxir.to_string(pretty: true)
|> IO.puts())

from(bucket: "<bucket>")
|> range(start: -1d)
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `fluxir` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:fluxir, "~> 0.1.0"}
  ]
end
```

## Supporting Flux version

Fluxir targets to support Flux [v0.143.0](https://docs.influxdata.com/flux/v0.x/release-notes/#v01430-2021-11-22) now.

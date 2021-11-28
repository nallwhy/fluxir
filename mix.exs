defmodule Fluxir.MixProject do
  use Mix.Project

  @version "0.1.0"
  @source_url "https://github.com/nallwhy/fluxir"

  def project do
    [
      app: :fluxir,
      version: @version,
      elixir: "~> 1.10",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),

      # Hex
      description: "Fluxir is a Flux builder for Elixir.",
      package: package(),

      # Docs
      name: "Fluxir",
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.24", only: :dev, runtime: false}
    ]
  end

  defp aliases() do
    [
      test: ["compile --warnings-as-errors", "test"]
    ]
  end

  defp package() do
    [
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp docs() do
    [
      main: "Fluxir",
      source_ref: "v#{@version}",
      source_url: @source_url
    ]
  end
end

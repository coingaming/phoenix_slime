defmodule PhoenixSlime.Mixfile do
  use Mix.Project

  @version "0.12.0"

  def project do
    [
      app: :phoenix_slime,
      deps: deps(),
      description: "Phoenix Template Engine for Slim-like templates",
      elixir: "~> 1.4",
      package: package(),
      version: @version
    ]
  end

  def application do
    [applications: [:phoenix, :slime]]
  end

  def deps do
    [
      {:phoenix, "~> 1.4", override: true},
      {:phoenix_html, "~> 2.13"},
      {:phoenix_live_view, "~> 0.1"},
      {:jason, "~> 1.0", optional: true},
      {:slime, "~> 1.0"},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:earmark, ">= 0.0.0", only: :dev}
    ]
  end

  defp package do
    [
      maintainers: ["Sean Callan", "Alexander Stanko", "Reio Piller"],
      files: ["lib", "priv", "mix.exs", "README*", "LICENSE*"],
      licenses: ["MIT"],
      links: %{github: "https://github.com/coingaming/phoenix_slime"},
      organization: "coingaming"
    ]
  end
end

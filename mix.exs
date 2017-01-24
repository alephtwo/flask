defmodule Flask.Mixfile do
  use Mix.Project

  def project do
    [app: :flask,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [applications: [:logger, :httpoison]]
  end

  defp deps do
    [
      {:httpoison, "~> 0.11.0"},
      {:poison, "~> 3.1.0"},
      {:credo, "~> 0.6", only: [:dev, :test]}
    ]
  end
end

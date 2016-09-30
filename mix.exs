defmodule Flask.Mixfile do
  use Mix.Project

  def project do
    [app: :flask,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [applications: [:logger, :httpoison]]
  end

  defp deps do
    [
      {:httpoison, "~> 0.9.2"},
      {:poison, "~> 2.2.0"}
    ]
  end
end

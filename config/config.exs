use Mix.Config

config :flask,
  region: "us",
  locale: "en_US",
  debug: true,
  timeout: 30_000

# Import the API key!
import_config "secrets.exs"

use Mix.Config

config :flask, region: "us"
config :flask, locale: "en_US"
config :flask, debug: true
config :flask, timeout: 8000

# Import the API key!
import_config "secrets.exs"

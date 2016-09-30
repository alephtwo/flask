use Mix.Config

config :flask, region: "us"
config :flask, locale: "en_US"

# Import the API key!
import_config "secrets.exs"

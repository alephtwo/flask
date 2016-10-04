use Mix.Config

config :flask, region: "us"
config :flask, locale: "en_US"
config :flask, debug: Mix.env == :dev

# Import the API key!
import_config "secrets.exs"

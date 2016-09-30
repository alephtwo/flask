defmodule Flask.Config do
  def api_url, do: "https://us.api.battle.net"
  def api_key, do: System.get_env("BNET_API_KEY")
end

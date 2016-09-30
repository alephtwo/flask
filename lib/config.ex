defmodule Flask.Config do
  def api_key, do: Application.get_env(:flask, :api_key)
  def api_url, do: "https://#{region}.api.battle.net"
  def locale, do: Application.get_env(:flask, :locale)
  def region, do: Application.get_env(:flask, :region)
  def debug, do: Mix.env == :dev
end

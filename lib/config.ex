defmodule Flask.Config do
  @moduledoc """
  Configuration for Flask.
  """
  def api_key, do: Application.get_env(:flask, :api_key)
  def locale, do: Application.get_env(:flask, :locale) || "en_US"
  def region, do: Application.get_env(:flask, :region) || "us"
  def timeout, do: Application.get_env(:flask, :timeout) || 30_000
  def api_url, do: "https://#{Flask.Config.region}.api.battle.net"
end

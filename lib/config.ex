defmodule Flask.Config do
  @moduledoc """
  Configuration for Flask.
  """
  def api_key, do: Application.get_env(:flask, :api_key)
  def api_url, do: "https://#{region}.api.battle.net"
  def locale, do: Application.get_env(:flask, :locale)
  def region, do: Application.get_env(:flask, :region)
  def timeout, do: Application.get_env(:flask, :timeout)
end

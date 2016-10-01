defmodule Flask.D3 do
  @moduledoc """
  Interface to the Battle.net Diablo 3 API.
  """
  alias Flask.API, as: API

  # Profile API
  def career_profile(battletag), do: call "profile/#{battletag}"
  def hero_profile(battletag, id), do: call "profile/#{battletag}/hero/#{id}"

  # Data Resources
  def item_data(data), do: call "data/item/#{data}"
  def follower_data(follower), do: call "data/item/#{follower}"
  def artisan_data(artisan), do: call "data/artisan/#{artisan}"

  # Private helpers
  defp call(endpoint), do: call(endpoint, %{})
  defp call(endpoint, queries) when is_map(queries) do
    API.fetch("/d3/#{URI.encode endpoint}", queries)
  end
end

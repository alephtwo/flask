defmodule Flask.D3 do
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
    Flask.API.fetch("/d3/#{URI.encode endpoint}", queries)
  end
end

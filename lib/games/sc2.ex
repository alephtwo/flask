defmodule SC2 do
  # Profile API
  def profile(id, region, name), do: call "profile/#{id}/#{region}/#{name}"
  def ladders(id, region, name) do
    call "profile/#{id}/#{region}/#{name}/ladders"
  end
  def match_history(id, region, name) do
    call "profile/#{id}/#{region}/#{name}/matches"
  end

  # Ladder API
  def ladder(id), do: call "ladder/#{id}"

  # Data Resources
  def achievements, do: call "data/achievements"
  def rewards, do: call "data/rewards"

  # Private helpers
  defp call(endpoint), do: call(endpoint, %{})
  defp call(endpoint, queries) when is_map(queries) do
    Flask.API.fetch("/sc2/#{URI.encode endpoint}", queries)
  end
end

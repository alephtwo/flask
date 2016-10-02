defmodule Flask.SC2 do
  @moduledoc """
  Interface to the Battle.net Starcraft 2 API.
  """
  alias Flask.API, as: API

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
    API.fetch("/sc2/#{URI.encode endpoint}", queries)
  end
end

defmodule Flask.WoW do
  # Achievements
  def achievement(id) when is_integer(id) do
    Flask.API.fetch "/wow/achievement/#{id}"
  end

  # Auctions
  def auctions(realm) do
    Flask.API.fetch "/wow/auction/data/#{realm}"
    # TODO: Consume JSON file if successful
  end

  # Bosses
  def boss(id \\ ""), do: Flask.API.fetch "/wow/boss/#{id}"
  def bosses, do: boss

  # Challenge Mode
  def realm_leaderboard(realm), do: Flask.API.fetch "/wow/challenge/#{realm}"
  def region_leaderboard, do: Flask.API.fetch "/wow/challenge/region"

  # Realm Status
  def realms, do: realm_status([])
  def realm_status(realms) when is_list(realms) do
    queries = %{realms: Enum.join(realms, ",")}
    Flask.API.fetch("/wow/realm/status", queries)
  end
end

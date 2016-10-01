defmodule Flask.WoW do
  @moduledoc """
  Interface to the Battle.net World of Warcraft API.
  """
  alias Flask.API, as: API

  # Achievements
  def achievement(id) when is_integer(id), do: call "achievement/#{id}"

  # Auctions
  # TODO: Consume JSON file if successful
  def auctions(realm), do: call "auction/data/#{realm}"

  # Bosses
  def boss(id), do: call "boss/#{id}"
  def bosses, do: call "boss/" # Note the trailing slash

  # Challenge Mode
  def realm_leaderboard(realm), do: call "challenge/#{realm}"
  def region_leaderboard, do: call "challenge/region"

  # Character Profile
  # TODO: Add character endpoints

  # Guild Profile
  # TODO: Add guild endpoints

  # Items
  def item(id), do: call "item/#{id}"
  def item_set(id), do: call "item/set/#{id}"

  # Mounts
  def mounts, do: call "mount"

  # Pets
  def pets, do: call "pet/"
  def pet_abilities(id), do: call "pet/ability/#{id}"
  def pet_species(id), do: call "pet/species/#{id}"
  def pet_stats(id), do: call "pet/stats/#{id}"

  # PvP
  def leaderboards(bracket) do
    valid =
      bracket == "2v2"
      || bracket == "3v3"
      || bracket == "5v5"
      || bracket == "rbg"

    if valid do
      call "leaderboard/#{bracket}"
    else
      {:error, "Invalid bracket. Must be 2v2, 3v3, 5v5, or rbg."}
    end
  end

  # Quests
  def quest(id), do: call "quest/#{id}"

  # Realm Status
  def realms, do: realm_status([])
  def realm_status(inquiry) do
    queries = %{realms: inquiry |> List.wrap |> Enum.join(",")}
    call "realm/status", queries
  end

  # Recipes
  def recipe(id), do: call "recipe/#{id}"

  # Spells
  def spell(id), do: call "spell/#{id}"

  # Zones
  def zones, do: call "zone"
  def zone(id), do: call "zone/#{id}"

  # Misc. Data
  def battlegroups, do: call "data/battlegroups/" # Note the trailing slash
  def character_races, do: call "data/character/races"
  def character_classes, do: call "data/character/classes"
  def character_achievements, do: call "data/character/achievements"
  def guild_rewards, do: call "data/guild/rewards"
  def guild_perks, do: call "data/guild/perks"
  def guild_achievements, do: call "data/guild/achievements"
  def item_classes, do: call "data/item/classes"
  def talents, do: call "data/talents"
  def pet_types, do: call "data/pet/types"

  # Private helpers
  defp call(endpoint), do: call(endpoint, %{})
  defp call(endpoint, queries) when is_map(queries) do
    API.fetch("/wow/#{URI.encode endpoint}", queries)
  end
end

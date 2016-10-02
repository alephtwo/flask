defmodule Flask.WoW do
  @moduledoc """
  Interface to the Battle.net World of Warcraft API.
  """
  alias Flask.API, as: API

  # Achievements
  def achievement(id) when is_integer(id), do: call "achievement/#{id}"

  # Auctions
  def auctions(realm) do
    case call "auction/data/#{realm}" do
      {:ok, response} ->
        data_url = response[:files] |> List.first |> Map.get("url")
        case HTTPoison.get(data_url) do
          {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
            {:ok, Poison.decode!(body)}
          {:error, %HTTPoison.Error{reason: reason}} ->
            {:error, reason}
        end
    end
  end

  # Bosses
  def boss(id), do: call "boss/#{id}"
  def bosses, do: call "boss/" # Note the trailing slash

  # Challenge Mode
  def realm_leaderboard(realm), do: call "challenge/#{realm}"
  def region_leaderboard, do: call "challenge/region"

  # Character Profile
  def character(realm, name), do: character(realm, name, [])
  def character(realm, name, fields) when is_list(fields) do
    valid_fields = ~w(
      achievements
      appearance
      feed
      guild
      hunterPets
      items
      mounts
      pets
      petSlots
      progression
      pvp
      quests
      reputation
      statistics
      stats
      talents
      titles
      audit
    )a
    queries = %{
      fields: fields
              |> Enum.filter(fn x -> Enum.member?(valid_fields, x) end)
              |> Enum.join(",")
    }
    call "character/#{realm}/#{name}", queries
  end

  # Guild Profiles
  def guild(realm, name), do: guild(realm, name, [])
  def guild(realm, name, fields) when is_list(fields) do
    valid_fields = ~w(achievements members news challenge)a
    queries = %{
      fields: fields
              |> Enum.filter(fn x -> Enum.member?(valid_fields, x) end)
              |> Enum.join(",")
    }
    call "guild/#{realm}/#{name}", queries
  end

  # Items
  def item(id), do: call "item/#{id}"
  def item_set(id), do: call "item/set/#{id}"

  # Mounts
  def mounts, do: call "mount/"

  # Pets
  def pets, do: call "pet/"
  def pet_abilities(id), do: call "pet/ability/#{id}"
  def pet_species(id), do: call "pet/species/#{id}"
  def pet_stats(id), do: call "pet/stats/#{id}"

  # PvP
  def leaderboards(bracket) do
    valid_brackets = ~w(2v2 3v3 5v5 rbg)
    unless Enum.member?(valid_brackets, bracket) do
      call "leaderboard/#{bracket}"
    else
      {:error, "Invalid bracket. [#{Enum.join(valid_brackets, ", ")}]"}
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
  def zones, do: call "zone/"
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

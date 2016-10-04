defmodule Flask do
  @moduledoc """
  Interface to the Battle.net World of Warcraft API.
  """
  alias Flask.API

  defmacro unwrap(call, atom) do
    quote do
      result = with {:ok, r} <- unquote(call),
                    do: Keyword.get(r, unquote(atom))
      if result == nil do
        {:error, "Unable to extract result"}
      else
        {:ok, result}
      end
    end
  end

  # Achievements
  def achievement(id) when is_integer(id), do: call "achievement/#{id}"

  # Auctions
  def auctions(realm) do
    case call "auction/data/#{realm}" do
      {:ok, response} ->
        data_url = response[:files] |> List.first |> Map.get("url")
        get_auctions(data_url)
    end
  end
  defp get_auctions(data_url) do
    case HTTPoison.get(data_url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        m = Poison.decode!(body)
        case is_map(m) && Map.has_key?(m, "auctions") do
          true -> {:ok, m["auctions"]}
          _ -> {:error, "Invalid response from Battle.net API"}
        end
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end

  # Bosses
  def boss(id), do: call "boss/#{id}"
  def bosses, do: unwrap(call("boss/"), :bosses)

  # Challenge Mode
  # These functions are commented out since the calls take forever to finish.
  # def realm_leaderboard(realm), do: call "challenge/#{realm}"
  # def region_leaderboard, do: call "challenge/region"

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
  def item(id) do
    case call "item/#{id}" do
      {:ok, item} -> {:ok, Enum.into(item, %{})}
      fallback -> fallback
    end
  end
  def item_set(id), do: call "item/set/#{id}"

  # Mounts
  def mounts, do: unwrap(call("mount/"), :mounts)

  # Pets
  def pets, do: unwrap(call("pet/"), :pets)
  def pet_abilities(id), do: call "pet/ability/#{id}"
  def pet_species(id), do: call "pet/species/#{id}"
  def pet_stats(id), do: call "pet/stats/#{id}"

  # PvP
  def leaderboards(bracket) do
    valid_brackets = ~w(2v2 3v3 5v5 rbg)
    case Enum.member?(valid_brackets, bracket) do
      true -> call "leaderboard/#{bracket}"
      _ -> {:error, "Invalid bracket. [#{Enum.join(valid_brackets, ", ")}]"}
    end
  end

  # Quests
  def quest(id), do: call "quest/#{id}"

  # Realm Status
  def realms, do: realm_status([])
  def realm_status(inquiry) do
    queries = %{realms: inquiry |> List.wrap |> Enum.join(",")}
    unwrap(call("realm/status", queries), :realms)
  end

  # Recipes
  def recipe(id), do: call "recipe/#{id}"

  # Spells
  def spell(id), do: call "spell/#{id}"

  # Zones
  def zones, do: unwrap(call("zone/"), :zones)
  def zone(id), do: call "zone/#{id}"

  # Misc. Data
  def battlegroups, do: unwrap(call("data/battlegroups/"), :battlegroups)
  def character_races, do: unwrap(call("data/character/races"), :races)
  def character_classes, do: unwrap(call("data/character/classes"), :classes)
  def character_achievements do
    unwrap(call("data/character/achievements"), :achievements)
  end
  def guild_rewards, do: unwrap(call("data/guild/rewards"), :rewards)
  def guild_perks, do: unwrap(call("data/guild/perks"), :perks)
  def guild_achievements do
    unwrap(call("data/guild/achievements"), :achievements)
  end
  def item_classes, do: unwrap(call("data/item/classes"), :classes)
  def talents, do: call "data/talents"
  def pet_types, do: unwrap(call("data/pet/types"), :petTypes)

  # Private helpers
  defp call(endpoint), do: call(endpoint, %{})
  defp call(endpoint, queries) when is_map(queries) do
    API.fetch("/wow/#{URI.encode endpoint}", queries)
  end
end

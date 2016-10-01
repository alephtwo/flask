defmodule FlaskWoWTest do
  use ExUnit.Case
  doctest Flask.WoW
  alias Flask.WoW, as: WoW

  test "the truth" do
    assert 1 + 1 == 2
  end

  # Achievements
  test "achievement", do: assert {:ok, _} = WoW.achievement(6)

  # Auctions
  # TODO: Consume JSON file if successful
  test "auctions", do: assert {:ok, _} = WoW.auctions("mal'ganis")

  # Bosses
  test "boss", do: assert {:ok, _} = WoW.boss(110929)
  test "bosses", do: assert {:ok, _} = WoW.bosses

  # # Challenge Mode
  # TODO: These time out...
  # def realm_leaderboard(realm), do: call "challenge/#{realm}"
  # def region_leaderboard, do: call "challenge/region"

  # Character Profile
  # TODO: Add character endpoints

  # Guild Profile
  # TODO: Add guild endpoints

  # Items
  # def item(id), do: call "item/#{id}"
  # def item_set(id), do: call "item/set/#{id}"

  # Mounts
  # def mounts, do: call "mount"

  # Pets
  # def pets, do: call "pet/"
  # def pet_abilities(id), do: call "pet/ability/#{id}"
  # def pet_species(id), do: call "pet/species/#{id}"
  # def pet_stats(id), do: call "pet/stats/#{id}"

  # PvP
  # def leaderboards(bracket) do

  # Quests
  # def quest(id), do: call "quest/#{id}"

  # Realm Status
  # def realms, do: realm_status([])
  # def realm_status(inquiry) do

  # Recipes
  # def recipe(id), do: call "recipe/#{id}"

  # Spells
  # def spell(id), do: call "spell/#{id}"

  # Zones
  # def zones, do: call "zone"
  # def zone(id), do: call "zone/#{id}"

  # # Misc. Data
  # def battlegroups, do: call "data/battlegroups/" # Note the trailing slash
  # def character_races, do: call "data/character/races"
  # def character_classes, do: call "data/character/classes"
  # def character_achievements, do: call "data/character/achievements"
  # def guild_rewards, do: call "data/guild/rewards"
  # def guild_perks, do: call "data/guild/perks"
  # def guild_achievements, do: call "data/guild/achievements"
  # def item_classes, do: call "data/item/classes"
  # def talents, do: call "data/talents"
  # def pet_types, do: call "data/pet/types"
end

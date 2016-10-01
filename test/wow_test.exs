defmodule FlaskTest.WoW do
  use ExUnit.Case
  doctest Flask.WoW
  alias Flask.WoW, as: WoW

  test "the truth" do
    assert 1 + 1 == 2
  end

  # Achievements
  @tag external: true
  test "achievement", do: assert {:ok, _} = WoW.achievement(6)

  # Auctions
  # TODO: Consume JSON file if successful
  @tag external: true
  test "auctions", do: assert {:ok, _} = WoW.auctions("mal'ganis")

  # Bosses
  @tag external: true
  test "boss", do: assert {:ok, _} = WoW.boss(110929)
  @tag external: true
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
  @tag external: true
  test "battlegroups", do: assert {:ok, _} = WoW.battlegroups
  @tag external: true
  test "character_races", do: assert {:ok, _} = WoW.character_races
  @tag external: true
  test "character_classes", do: assert {:ok, _} = WoW.character_classes
  @tag external: true
  test "character_achievements", do: assert {:ok, _} = WoW.character_achievements
  @tag external: true
  test "guild_rewards", do: assert {:ok, _} = WoW.guild_rewards
  @tag external: true
  test "guild_perks", do: assert {:ok, _} = WoW.guild_perks
  @tag external: true
  test "guild_achievements", do: assert {:ok, _} = WoW.guild_achievements
  @tag external: true
  test "item_classes", do: assert {:ok, _} = WoW.item_classes
  @tag external: true
  test "talents", do: assert {:ok, _} = WoW.talents
  @tag external: true
  test "pet_types", do: assert {:ok, _} = WoW.pet_types
end

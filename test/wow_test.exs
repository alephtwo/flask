defmodule FlaskTest.WoW do
  use ExUnit.Case
  import FlaskTest
  alias Flask.WoW, as: WoW
  doctest Flask.WoW

  # Achievements
  @tag external: true
  test "achievement", do: assert_ok(WoW.achievement(6))

  # Auctions
  @tag external: true
  test "auctions", do: assert_ok(WoW.auctions("mal'ganis"))

  # Bosses
  @tag external: true
  test "boss", do: assert_ok(WoW.boss(110929))
  @tag external: true
  test "bosses", do: assert_ok(WoW.bosses)

  # Challenge Mode
  # TODO: These time out for right now.
  # def realm_leaderboard(realm), do: call "challenge/#{realm}"
  # def region_leaderboard, do: call "challenge/region"

  # Character Profile
  @tag external: true
  test "character", do: assert_ok(WoW.character("mal'ganis", "gurgthock"))

  # Guild Profile
  @tag external: true
  test "guild", do: assert_ok(WoW.guild("mal'ganis", "elitist jerks"))

  # Items
  # def item(id), do: call "item/#{id}"
  @tag external: true
  test "item", do: assert_ok(WoW.item(16833))
  # def item_set(id), do: call "item/set/#{id}"
  @tag external: true
  test "item_set", do: assert_ok(WoW.item_set(1060))

  # Mounts
  @tag external: true
  test "mounts", do: assert_ok(WoW.mounts)

  # Pets
  @tag external: true
  test "pets", do: assert_ok(WoW.pets)
  @tag external: true
  test "pet_abilities", do: assert_ok(WoW.pet_abilities(640))
  @tag external: true
  test "pet_species", do: assert_ok(WoW.pet_species(640))
  @tag external: true
  test "pet_stats", do: assert_ok(WoW.pet_stats(640))

  # PvP
  @tag external: true
  test "leaderboards", do: assert_ok(WoW.leaderboards('2v2'))

  # Quests
  @tag external: true
  test "quest", do: assert_ok(WoW.quest(13146))

  # Realm Status
  @tag external: true
  test "realms", do: assert_ok(WoW.realms)
  @tag external: true
  test "realm_status", do: assert_ok(WoW.realm_status("mal'ganis"))
  @tag external: true
  test "realm status (multiple realms)" do
    assert_ok(WoW.realm_status(~w(mal'ganis illidan greymane)))
  end

  # Recipes
  @tag external: true
  test "recipe", do: assert_ok(WoW.recipe(33994))

  # Spells
  @tag external: true
  test "spell", do: assert_ok(WoW.spell(5))

  # Zones
  @tag external: true
  test "zones", do: assert_ok(WoW.zones)
  @tag external: true
  test "zone", do: assert_ok(WoW.zone(4131))

  # Misc. Data
  @tag external: true
  test "battlegroups", do: assert_ok(WoW.battlegroups)
  @tag external: true
  test "character_races", do: assert_ok(WoW.character_races)
  @tag external: true
  test "character_classes", do: assert_ok(WoW.character_classes)
  @tag external: true
  test "character_achievements", do: assert_ok(WoW.character_achievements)
  @tag external: true
  test "guild_rewards", do: assert_ok(WoW.guild_rewards)
  @tag external: true
  test "guild_perks", do: assert_ok(WoW.guild_perks)
  @tag external: true
  test "guild_achievements", do: assert_ok(WoW.guild_achievements)
  @tag external: true
  test "item_classes", do: assert_ok(WoW.item_classes)
  @tag external: true
  test "talents", do: assert_ok(WoW.talents)
  @tag external: true
  test "pet_types", do: assert_ok(WoW.pet_types)
end

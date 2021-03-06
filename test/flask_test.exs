defmodule FlaskTest do
  use ExUnit.Case
  import FlaskTest.Macros
  doctest Flask

  # Achievements
  @tag external: true
  test "achievement", do: assert_ok(Flask.achievement(6))

  # Auctions
  @tag external: true
  @tag timeout: 120000
  test "auctions", do: assert_ok(Flask.auctions("mal'ganis"))

  # Bosses
  @tag external: true
  test "boss", do: assert_ok(Flask.boss(110929))
  @tag external: true
  test "bosses", do: assert_ok(Flask.bosses)

  # Challenge Mode
  # These tests are commented out since these API calls take forever to finish.
  # @tag external: true
  # @tag timeout: 180000
  # test "realm_leaderboard", do: assert_ok(Flask.realm_leaderboard("mal'ganis"))
  # @tag external: true
  # @tag timeout: 120000
  # test "region_leaderboard", do: assert_ok(Flask.region_leaderboard)

  # Character Profile
  @tag external: true
  test "character", do: assert_ok(Flask.character("mal'ganis", "gurgthock"))

  # Guild Profile
  @tag external: true
  test "guild", do: assert_ok(Flask.guild("mal'ganis", "elitist jerks"))

  # Items
  @tag external: true
  test "item", do: assert_ok(Flask.item(16833))
  @tag external: true
  test "item_set", do: assert_ok(Flask.item_set(1060))

  # Mounts
  @tag external: true
  test "mounts", do: assert_ok(Flask.mounts)

  # Pets
  @tag external: true
  test "pets", do: assert_ok(Flask.pets)
  @tag external: true
  test "pet_abilities", do: assert_ok(Flask.pet_abilities(640))
  @tag external: true
  test "pet_species", do: assert_ok(Flask.pet_species(640))
  @tag external: true
  test "pet_stats", do: assert_ok(Flask.pet_stats(640))

  # PvP
  @tag external: true
  test "leaderboards", do: assert_ok(Flask.leaderboards("2v2"))

  # Quests
  @tag external: true
  test "quest", do: assert_ok(Flask.quest(13146))

  # Realm Status
  @tag external: true
  test "realms", do: assert_ok(Flask.realms)
  @tag external: true
  test "realm_status", do: assert_ok(Flask.realm_status("mal'ganis"))
  @tag external: true
  test "realm status (multiple realms)" do
    assert_ok(Flask.realm_status(~w(mal'ganis illidan greymane)))
  end

  # Recipes
  @tag external: true
  test "recipe", do: assert_ok(Flask.recipe(33994))

  # Spells
  @tag external: true
  test "spell", do: assert_ok(Flask.spell(5))

  # Zones
  @tag external: true
  test "zones", do: assert_ok(Flask.zones)
  @tag external: true
  test "zone", do: assert_ok(Flask.zone(4131))

  # Misc. Data
  @tag external: true
  test "battlegroups", do: assert_ok(Flask.battlegroups)
  @tag external: true
  test "character_races", do: assert_ok(Flask.character_races)
  @tag external: true
  test "character_classes", do: assert_ok(Flask.character_classes)
  @tag external: true
  test "character_achievements", do: assert_ok(Flask.character_achievements)
  @tag external: true
  test "guild_rewards", do: assert_ok(Flask.guild_rewards)
  @tag external: true
  test "guild_perks", do: assert_ok(Flask.guild_perks)
  @tag external: true
  test "guild_achievements", do: assert_ok(Flask.guild_achievements)
  @tag external: true
  test "item_classes", do: assert_ok(Flask.item_classes)
  @tag external: true
  test "talents", do: assert_ok(Flask.talents)
  @tag external: true
  test "pet_types", do: assert_ok(Flask.pet_types)
end

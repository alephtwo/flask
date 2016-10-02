defmodule FlaskTest.API do
  use ExUnit.Case
  import FlaskTest.Macros
  alias Flask.API, as: API
  doctest Flask.API

  @tag external: true
  test "fetch (no queries)", do: assert_ok(API.fetch "/wow/realm/status")

  @tag external: true
  test "fetch (queries)" do
    assert_ok(API.fetch "/wow/realm/status", %{realms: "mal'ganis"})
  end
end

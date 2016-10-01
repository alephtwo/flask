defmodule FlaskTest.API do
  use ExUnit.Case
  doctest Flask.API

  alias Flask.API, as: API

  defmacro assert_ok(test) do
    quote do
      assert {:ok, _} = unquote(test)
    end
  end

  @tag external: true
  test "fetch (no queries)" do
    assert_ok(API.fetch "/wow/realm/status")
  end

  @tag external: true
  test "fetch (queries)" do
    assert_ok(API.fetch "/wow/realm/status", %{realms: "mal'ganis"})
  end
end

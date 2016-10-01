defmodule FlaskAPITest do
  use ExUnit.Case
  doctest Flask.API

  test "fetch (no queries)" do
    assert {:ok, _} = Flask.API.fetch "/wow/realm/status"
  end

  test "fetch (queries)" do
    assert {:ok, _} = Flask.API.fetch "/wow/realm/status", %{realms: "mal'ganis"}
  end
end

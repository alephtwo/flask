defmodule Flask.WoW do
  def realms(realms \\ []) do
    queries = %{realms: Enum.join(realms, ",")}
    Flask.API.fetch!("/wow/realm/status", queries)
  end
end

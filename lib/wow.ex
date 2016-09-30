defmodule Flask.WoW do
  def realms do
    Flask.API.fetch("/wow/realm/status")
  end

  def realm_status(realms) when is_list(realms) do
    queries = %{realms: Enum.join(realms, ",")}
    Flask.API.fetch("/wow/realm/status", queries)
  end
end

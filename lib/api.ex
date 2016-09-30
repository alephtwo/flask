defmodule Flask.API do
  use HTTPoison.Base

  def fetch!(endpoint, queries \\ %{}) do
    q = Map.merge(queries, %{apikey: Flask.Config.api_key})
    url = "#{Flask.Config.api_url}#{endpoint}?#{URI.encode_query(q)}"
    get!(url) |> Map.get(:body)
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end
end

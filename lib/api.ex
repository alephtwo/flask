defmodule Flask.API do
  use HTTPoison.Base

  def fetch(endpoint, queries \\ %{}) do
    q = Map.merge(queries, %{apikey: Flask.Config.api_key})
    url = "#{Flask.Config.api_url}#{endpoint}?#{URI.encode_query(q)}"
    body = Map.get(get!(url), :body)

    # Handle errors gracefully!
    case body do
      [code: code, detail: detail, type: type] ->
        {:error, "#{code} #{type} (#{detail})"}
      body ->
        {:ok, body}
    end
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end
end

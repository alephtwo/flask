defmodule Flask.API do
  use HTTPoison.Base

  def fetch(endpoint, queries \\ %{}) do
    q = Map.merge(queries, %{
      apikey: Flask.Config.api_key,
      locale: Flask.Config.locale
    })
    url = "#{Flask.Config.api_url}#{endpoint}?#{URI.encode_query(q)}"
    if Flask.Config.debug, do: IO.puts(url)
    body = Map.get(get!(url), :body)
    # Handle errors gracefully!
    case body do
      # Rejected
      [code: c, detail: d, type: t] -> {:error, "#{c} #{t} (#{d})"}
      # Error
      [reason: r, status: _] -> {:error, "#{r}"}
      # It worked?
      body -> {:ok, body}
    end
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end
end

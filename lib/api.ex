defmodule Flask.API do
  @moduledoc """
  The base interface with the Battle.net API.
  """
  use HTTPoison.Base
  require Logger

  alias Flask.Config, as: Config

  def fetch(endpoint, queries \\ %{}) do
    q = Map.merge(queries, auth_queries)
    url = "#{Config.api_url}#{endpoint}?#{URI.encode_query(q)}"
    Logger.debug url
    case get(url, [], [timeout: Config.timeout]) do
      {:ok, response} -> handle_response(response)
      other -> other
    end
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end

  defp handle_response(response) do
    case Map.get(response, :body) do
      [code: c, detail: d, type: t] -> {:error, %{code: c, detail: d, type: t}}
      [reason: r, status: s] -> {:error, %{reason: r, status: s}}
      body -> {:ok, body}
    end
  end

  defp auth_queries do
    %{
      apikey: Config.api_key,
      locale: Config.locale
    }
  end
end

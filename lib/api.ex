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
    try do
      get!(url, [], [timeout: Config.timeout])
      |> Map.get(:body)
      |> handle_body
    rescue
      e in HTTPoison.Error ->
        Logger.error "Encountered error accessing #{url} [#{inspect(e)}]"
        {:error, e}
    end
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end

  defp handle_body(body) do
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

  defp auth_queries do
    %{
      apikey: Config.api_key,
      locale: Config.locale
    }
  end
end

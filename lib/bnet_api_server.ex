defmodule BnetApi.Server do

  require Logger
  @moduledoc """
  Documentation for BnetApi.
  """

  @doc """
  This is just a passthrough for the api it returns a JSON payload for given the response:
  there are three paths (one for each api)

  /wow
  /d3
  /starcraft

  """

  require Logger

  use Ace.HTTP.Service, [
    port: Application.get_env(:bnet_api, :port),
    cleartext: true
    # certfile: Application.get_env(:bnet_api, :cert_path),
    # keyfile: Application.get_env(:bnet_api, :key_path)
  ]
  use Raxx.SimpleServer

  _callback_path = Application.get_env(:bnet_api, :redirect_uri)

  @impl Raxx.SimpleServer
  def handle_request(%{method: :GET, path: [game, method], query: query}, _state) do
    opts = URI.decode_query(query)
    |> Map.put_new("region", "us")
    
    resp = case game do
      "wow" -> make_wow_request(method, opts)
      "d3" -> make_d3_request(method, opts)
      "starcraft" -> make_sc2_request(method, opts)
    end
    
    response(:ok)
    |> set_header("content-type", "application/json")
    |> set_body(resp)

  end

  defp make_wow_request(method, opts) do
    case apply(BnetApi.Request.Wow, String.to_atom(method), [opts]) do
      {:ok, env} ->
        Jason.encode!(env.body)
      :error -> nil
    end
  end

  defp make_d3_request(method, opts) do
    case apply(BnetApi.Request.Diablo, String.to_atom(method), [opts]) do
      {:ok, env} ->
        Jason.encode!(env.body)
      :error -> nil
    end
  end

  defp make_sc2_request(method, opts) do
    case apply(BnetApi.Request.Starcraft, String.to_atom(method), [opts]) do
      {:ok, env} ->
        Jason.encode!(env.body)
      anythingelse -> Logger.warn("#{inspect anythingelse}")
    end
  end

end

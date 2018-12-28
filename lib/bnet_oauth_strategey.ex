defmodule BattleNet do
  use OAuth2.Strategy

  # Public API

  def client(region \\ "us") do
    OAuth2.Client.new([
      strategy: __MODULE__,
      client_id: System.get_env("BNET_CLIENT_ID"),
      client_secret: System.get_env("BNET"),
      redirect_uri: Application.get_env(:bnet_oauth, :redirect_uri),
      site: "#{region}.Application.get_env(:bnet, :api_uri)",
      authorize_url: "https://github.com/login/oauth/authorize",
      token_url: "https://github.com/login/oauth/access_token"
    ])
  end

  def authorize_url! do
    OAuth2.Client.authorize_url!(client(), scope: "user,public_repo")
  end

  # you can pass options to the underlying http library via `opts` parameter
  def get_token!(params \\ [], headers \\ [], opts \\ []) do
    OAuth2.Client.get_token!(client(), params, headers, opts)
  end

  # Strategy Callbacks

  def authorize_url(client, params) do
    OAuth2.Strategy.AuthCode.authorize_url(client, params)
  end

  def get_token(client, params, headers) do
    client
    |> put_param(:client_secret, client.client_secret)
    |> put_header("accept", "application/json")
    |> OAuth2.Strategy.AuthCode.get_token(params, headers)
  end
end
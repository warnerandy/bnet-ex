use Mix.Config

config :bnet_api,
	port: String.to_integer(System.get_env("BNET_PORT")),
	api_uri: "api.blizzard.com",
	oauth_uri: "battle.net",
	redirect_uri: "/authorize/oauth2/callback",
	client_id: System.get_env("BNET_CLIENT_ID"),
	client_secret: System.get_env("BNET_SECRET"),
	cert_path: System.get_env("BNET_CERT_PATH"),
	key_path: System.get_env("BNET_KEY_PATH")
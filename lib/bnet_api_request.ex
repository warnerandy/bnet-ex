defmodule BnetApi.Request do
	use Tesla
	use GenServer

	require Logger

	plug Tesla.Middleware.Headers, [{"accept", "application/json"}]
	plug Tesla.Middleware.JSON

	
	def start_link(state \\ %{access_token: %{}}) do
		Logger.info "starting: #{__MODULE__}"
		GenServer.start_link(__MODULE__, state, name: __MODULE__)
	end
	def init(state) do
		{:ok, state}
	end

	# get access token for most bnet calls
	def get_access_token(region \\ "us") do
		client = Tesla.build_client [
			{Tesla.Middleware.BasicAuth, %{
				username: Application.get_env(:bnet_api, :client_id),
				password: Application.get_env(:bnet_api, :client_secret)
			}},
			Tesla.Middleware.JSON,
			{Tesla.Middleware.BaseUrl, "https://#{region}.#{Application.get_env(:bnet_api, :oauth_uri)}"}
		]
		client
		|> Tesla.get("/oauth/token?grant_type=client_credentials", [])
		|> process_response
	end

	defp process_response({:ok, %{body: body}}) do
		body
	end

	defp process_response({_, response}) do
		response
	end

	def get_token(state, region \\ "us") do
		Map.get(state, region)
		|> Map.get("access_token")
	end

	def get_token_client(state, region \\ "us") do
		Tesla.build_client [
			{Tesla.Middleware.Headers, [
				{"Authorization", "Bearer #{get_token(state, region)}"}
			]},
			# Tesla.Middleware.JSON,
			{Tesla.Middleware.BaseUrl, "https://#{region}.#{Application.get_env(:bnet_api, :api_uri)}"}
		]
	end

	def make_access_token_call(state, path, region) do
		get_token_client(state, region)
		|> get(path)
	end
	# end access token

	def handle_call({:make_call, {path, region}}, _from, state) do
		new_state = case Map.has_key?(state, region) do
			false ->
				Map.put(state, region, get_access_token(region))
			true ->
				state
		end
		response = new_state
		|> make_access_token_call(path, region)
		{:reply, response, new_state}
	end

	def make_call(path, region) do
		GenServer.call(__MODULE__, {:make_call, {path, region}})
	end

	def module_name() do
		__MODULE__
	end
end
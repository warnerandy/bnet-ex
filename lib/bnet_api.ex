defmodule BnetApi do
	use Application
	require Logger

	def start(_type, _args) do
		Logger.info "Starting BNet API Application"

		if (Application.get_env(:bnet_api, :client_id) == nil) do
			Logger.warn "No client id detected please set the System Env var BNET_CLIENT_ID"
		end
		if (Application.get_env(:bnet_api, :client_secret) == nil) do
			Logger.warn "No client secret detected please set the System Env var BNET_SECRET"
		end
		if (Application.get_env(:bnet_api, :port) == nil) do
			Logger.warn "No client secret detected please set the System Env var BNET_PORT"
		end
		
		import Supervisor.Spec, warn: false

		children = [
			{BnetApi.Server, [%{}]},
			{BnetApi.Request, %{access_token: %{}}}
		]

	opts = [strategy: :one_for_one, name: BnetApi.Supervisor]
	Supervisor.start_link(children, opts)
	end
end
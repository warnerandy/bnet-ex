defmodule BnetApi do
	use Application
	require Logger

	def start(_type, _args) do
		Logger.info "Starting BNet API Application"
		import Supervisor.Spec, warn: false

		children = [
			{BnetApi.Server, [%{}]},
			{BnetApi.Request, %{access_token: %{}}}
		]

	opts = [strategy: :one_for_one, name: BnetApi.Supervisor]
	Supervisor.start_link(children, opts)
	end
end
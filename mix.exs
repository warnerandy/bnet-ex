defmodule BnetApi.MixProject do
  use Mix.Project

  def project do
    [
      app: :bnet_api,
      description: "A simple api library for battle.net (develop.battle.net)",
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :jason],
      mod: {BnetApi, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:tesla, "~> 1.1.0"},
      {:jason, ">= 1.0.0"},
      {:oauth2, "~> 0.9"},
      {:ace, "~> 0.18.0"},
      {:ex_doc, ">= 0.0.0", only: [:dev, :test], runtime: false}
    ]
  end

   defp package do
    [
      maintainers: ["Andy Warner"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/warnerandy/bnet-ex"}
    ]
  end
end

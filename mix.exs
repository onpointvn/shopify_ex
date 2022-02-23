defmodule ShopifyEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :shopify_ex,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # HTTP Client
      {:tesla, "~> 1.4"},
      {:hackney, "~> 1.17"},

      # Params Validator
      {:tarams, "~> 1.2"},

      # UUID Generator
      {:elixir_uuid, "~> 1.2"},

      # JSON Parser
      {:jason, "~> 1.2"},

      # HTML Parser
      {:floki, "~> 0.32.0"}
    ]
  end
end

defmodule Issues.MixProject do
  use Mix.Project

  def project do
    [
      app: :issues,
      escript: escript_config(),
      version: "0.1.0",
      name: "Issues",
      source_url: "https://github.com/Yukio0315/Practice-Elixir",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :httpoison]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      httpoison: "~> 1.6",
      poison: "~> 3.1",
      ex_doc: "~> 0.21",
      earmark: "~> 1.4.3"
    ]
  end

  defp escript_config do
    [main_module: Issues.CLI]
  end
end

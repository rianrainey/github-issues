defmodule Issues.Mixfile do
  use Mix.Project

  def project do
    [app:     :issues,
     version: "0.0.1",
     elixir:  ">= 0.0.0",
     escript: escript_config,
     name:    "Github Issues",
     deps:    deps]
  end

  # Configuration for the OTP application
  def application do
    [
      applications: [ :logger, :httpoison, :jsx ]
     ]
  end

  defp deps do
    [
      { :httpoison, "~> 0.4" },
      { :jsx,       "~> 2.0" },
      { :ex_doc,    github: "elixir-lang/ex_doc" },
      {:earmark,    ">= 0.0.0"}
    ]
  end

  defp escript_config do
    [ main_module: Issues.CLI ]
  end
end

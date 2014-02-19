defmodule Squigglies.Mixfile do
  use Mix.Project

  def project do
    [ app: :squigglies,
      version: "0.0.1",
      dynamos: [Squigglies.Dynamo],
      compilers: [:elixir, :dynamo, :app],
      env: [prod: [compile_path: "ebin"]],
      compile_path: "tmp/#{Mix.env}/squigglies/ebin",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [ applications: [:cowboy, :dynamo],
      mod: { Squigglies, [] } ]
  end

  defp deps do
    [ { :cowboy, github: "extend/cowboy" },
      { :dynamo, tag: "elixir-0.12.2", github: "dynamo/dynamo" } ]
  end
end

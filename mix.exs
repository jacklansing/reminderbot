defmodule ReminderBot.MixProject do
  use Mix.Project

  def project do
    [
      app: :reminder_bot,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {ReminderBot.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:nostrum, "~> 0.4"},
      {:quantum, "~> 3.0"},
      {:ecto_sql, "~> 3.0"},
      {:ecto_sqlite3, "~> 0.5.5"}
    ]
  end
end

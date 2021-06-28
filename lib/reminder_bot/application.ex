defmodule ReminderBot.Application do
  use Supervisor

  def start(_type, args \\ []) do
    Supervisor.start_link(__MODULE__, args, name: __MODULE__)
  end

  @impl true
  def init(_init_arg) do
    children = [
      ReminderBot.Repo,
      ReminderBot.Scheduler,
      ReminderBot.Consumer
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end

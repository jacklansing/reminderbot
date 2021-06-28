defmodule ReminderBot.Supervisor do
  use Supervisor

  def start_link(args \\ []) do
    Supervisor.start_link(__MODULE__, args, name: __MODULE__)
  end

  def start(_type, _args) do
    start_link()
  end

  @impl true
  def init(_init_arg) do
    children = [ReminderBot.Application]
    Supervisor.init(children, strategy: :one_for_one)
  end
end

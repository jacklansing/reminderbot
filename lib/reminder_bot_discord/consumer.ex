defmodule ReminderBot.Consumer do
  use Nostrum.Consumer

  alias Nostrum.Api
  alias ReminderBot.Commands.{Handler}

  def start_link do
    Consumer.start_link(__MODULE__)
  end

  def handle_event({:READY, _, _ws_state}) do
    Api.update_status(:online, "Epic Seven")
    Handler.register_commands()
  end

  def handle_event({:INTERACTION_CREATE, interaction, _ws_state}) do
    Handler.route_interaction(interaction)
  end

  def handle_event(_event) do
    :noop
  end
end

defmodule ReminderBot.Consumer do
  use Nostrum.Consumer

  alias Nostrum.Api
  alias ReminderBot.Commands.{Handler, Remind}

  def start_link do
    Consumer.start_link(__MODULE__)
  end

  def handle_event({:READY, _, _ws_state}) do
    # Register slash commands here
    Nostrum.Api.update_status(:online, "Epic Seven")
    test_guild_id = 348_582_536_844_148_736
    Api.create_guild_application_command(test_guild_id, Remind.get_command())
  end

  def handle_event({:INTERACTION_CREATE, interaction, _ws_state}) do
    Handler.route_interaction(interaction)
  end

  def handle_event(_event) do
    :noop
  end
end

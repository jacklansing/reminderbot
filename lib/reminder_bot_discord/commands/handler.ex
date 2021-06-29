defmodule ReminderBot.Commands.Handler do
  @moduledoc """
  Hands off interaction to appropriate module to be processed.
  """
  alias Nostrum.Api

  alias ReminderBot.Commands.{
    Remind
  }

  def route_interaction(interaction = %{data: %{name: "gwreminder"}}) do
    Remind.handle_interaction(interaction)
  end

  def register_commands() do
    case Application.get_env(:reminder_bot, :environment) do
      :prod ->
        Api.create_global_application_command(Remind.get_command())

      :dev ->
        test_guild_id = Application.get_env(:reminder_bot, :test_guild_id)
        Api.create_guild_application_command(test_guild_id, Remind.get_command())

      _ ->
        IO.puts("Did not detect dev or prod environment 😵")
    end
  end
end

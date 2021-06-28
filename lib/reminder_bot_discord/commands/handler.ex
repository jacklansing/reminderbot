defmodule ReminderBot.Commands.Handler do
  @moduledoc """
  Hands off interaction to appropriate module to be processed.
  """

  alias ReminderBot.Commands.{
    Remind
  }

  def route_interaction(interaction = %{data: %{name: "remind"}}) do
    Remind.handle_interaction(interaction)
  end
end

defmodule ReminderBot.Messages do
  alias Nostrum.Api

  def send_gw_reminder_messages(reminders) do
    for reminder <- reminders do
      Api.create_message(
        reminder.channel_id,
        "<@#{reminder.user_id}> Guild War reminder! Get in there!"
      )
    end
  end
end

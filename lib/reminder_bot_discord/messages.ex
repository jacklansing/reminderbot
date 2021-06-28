defmodule ReminderBot.Messages do
  alias Nostrum.Api

  def send_gw_reminder_messages(reminders) do
    # aggregate gw reminds per channel id,
    reminders_chunked = Enum.chunk_by(reminders, fn rm -> rm.channel_id end)

    for reminder_group <- reminders_chunked do
      group_channel_id = Enum.at(reminder_group, 0).channel_id

      reminder_group
      |> get_user_list()
      |> send_reminder(group_channel_id)
    end
  end

  defp get_user_list(reminder_group) do
    for rm <- reminder_group, do: "<@#{rm.user_id}> ", into: ""
  end

  defp send_reminder(reminder_group_mentions, group_channel_id) do
    message = reminder_group_mentions <> "Guild War reminder! Get in there!"
    Api.create_message(group_channel_id, message)
  end
end

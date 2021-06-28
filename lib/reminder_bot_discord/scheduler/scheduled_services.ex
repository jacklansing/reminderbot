defmodule ReminderBot.Scheduler.ScheduledServices do
  import Ecto.Query, warn: false
  alias ReminderBot.Repo
  alias ReminderBot.Schema.Reminder
  alias ReminderBot.Messages

  # Note: gw starts at 10:00 UTC ~ 6 ET

  def send_gw_reminders(reminder_type) do
    query =
      from(rm in Reminder,
        where: [reminder_type: ^reminder_type]
      )

    query
    |> Repo.all()
    |> Messages.send_gw_reminder_messages()
  end
end

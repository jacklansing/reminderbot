defmodule ReminderBot.Scheduler do
  use Quantum, otp_app: :reminder_bot

  import Ecto.Query, warn: false
  alias ReminderBot.Repo
  alias ReminderBot.Schema.Reminder
  alias ReminderBot.Messages

  # Note: gw starts at 10:00 UTC ~ 6 ET

  def send_super_early_reminders() do
    query =
      from(rm in Reminder,
        where: [reminder_type: "super_early"]
      )

    query
    |> Repo.all()
    |> Messages.send_gw_reminder_messages()
  end
end

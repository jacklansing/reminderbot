defmodule ReminderBot.Scheduler do
  use Quantum, otp_app: :reminder_bot

  def send_reminders() do
    IO.puts("Checking for reminders...")
  end
end

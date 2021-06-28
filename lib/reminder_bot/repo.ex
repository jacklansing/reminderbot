defmodule ReminderBot.Repo do
  use Ecto.Repo,
    otp_app: :reminder_bot,
    adapter: Ecto.Adapters.SQLite3
end

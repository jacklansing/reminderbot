defmodule ReminderBot.Schema.Reminder do
  use Ecto.Schema

  schema "reminders" do
    field(:user_id, :integer)
    field(:user_name, :string)
    field(:channel_id, :integer)
    field(:reminder_type, :string)
  end
end

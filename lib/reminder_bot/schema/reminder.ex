defmodule ReminderBot.Schema.Reminder do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reminders" do
    field(:user_id, :integer)
    field(:user_name, :string)
    field(:channel_id, :integer)
    field(:reminder_type, :string)
  end

  @fields [:user_id, :user_name, :channel_id, :reminder_type]

  def changeset(reminder, attrs) do
    reminder
    |> cast(attrs, @fields)
    |> unique_constraint(:user_id)
  end
end

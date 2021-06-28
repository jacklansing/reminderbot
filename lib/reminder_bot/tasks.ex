defmodule ReminderBot.Tasks do
  alias ReminderBot.Repo
  alias ReminderBot.Schema.{Reminder}

  def fetch_or_create_reminder(attrs) do
    case get_reminder_by_user_id(attrs.user_id) do
      %Reminder{} = reminder ->
        {:existing, reminder}

      _ ->
        %Reminder{}
        |> Reminder.changeset(attrs)
        |> Repo.insert()
    end
  end

  def get_reminder_by_user_id(user_id) do
    Repo.get_by(Reminder, user_id: user_id)
  end

  def update_reminder(%Reminder{} = reminder, attrs) do
    reminder
    |> Reminder.changeset(attrs)
    |> Repo.update()
  end
end

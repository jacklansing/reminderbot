defmodule ReminderBot.Repo.Migrations.AddRemindersTable do
  use Ecto.Migration

  def change do
    create table(:reminders) do
      add :user_id, :integer, null: false
      add :user_name, :string, null: false
      add :channel_id, :integer, null: false
      add :reminder_type, :string, null: false
    end
  end
end

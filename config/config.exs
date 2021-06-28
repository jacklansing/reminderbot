import Config

config :reminder_bot,
  ecto_repos: [ReminderBot.Repo]

config :nostrum,
  token: System.get_env("DISCORD_BOT_TOKEN"),
  num_shards: :auto

config :reminder_bot, ReminderBot.Scheduler,
  jobs: [
    {"* * * * *", {ReminderBot.Scheduler, :send_super_early_reminders, []}}
  ]

config :reminder_bot, ReminderBot.Repo, database: "./db/reminder_bot_data.db"

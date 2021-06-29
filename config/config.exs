import Config
alias ReminderBot.Scheduler
alias ReminderBot.Scheduler.Task

config :reminder_bot,
  environment: Mix.env(),
  ecto_repos: [ReminderBot.Repo]

config :nostrum,
  token: System.get_env("DISCORD_BOT_TOKEN"),
  num_shards: :auto

config :reminder_bot, ReminderBot.Scheduler,
  jobs: [
    {"0 14 * * 1,3,5", {Task, :send_super_early, []}},
    {"0 17 * * 1,3,5", {Task, :send_early, []}},
    {"0 22 * * 1,3,5", {Task, :send_late, []}},
    {"0 4 * * 2,4,6", {Task, :send_super_late, []}}
  ]

config :reminder_bot, ReminderBot.Repo, database: "./db/reminder_bot_data.db"

import Config
alias ReminderBot.Scheduler
alias ReminderBot.Scheduler.ScheduledServices

config :reminder_bot,
  ecto_repos: [ReminderBot.Repo]

config :nostrum,
  token: System.get_env("DISCORD_BOT_TOKEN"),
  num_shards: :auto

config :reminder_bot, ReminderBot.Scheduler,
  jobs: [
    {"* * * * *", fn -> ScheduledServices.send_gw_reminders("super_early") end},
    {"0 14 * * 1,3,5", fn -> ScheduledServices.send_gw_reminders("super_early") end},
    {"0 17 * * 1,3,5", fn -> ScheduledServices.send_gw_reminders("early") end},
    {"0 22 * * 1,3,5", fn -> ScheduledServices.send_gw_reminders("late") end},
    {"0 4 * * 2,4,6", fn -> ScheduledServices.send_gw_reminders("super_late") end}
  ]

config :reminder_bot, ReminderBot.Repo, database: "./db/reminder_bot_data.db"

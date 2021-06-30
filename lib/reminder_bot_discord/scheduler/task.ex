defmodule ReminderBot.Scheduler.Task do
  alias ReminderBot.Scheduler.ScheduledServices

  def send_super_early, do: ScheduledServices.send_gw_reminders("super_early")
  def send_early, do: ScheduledServices.send_gw_reminders("early")
  def send_late, do: ScheduledServices.send_gw_reminders("late")
  def send_super_late, do: ScheduledServices.send_gw_reminders("super_late")
end

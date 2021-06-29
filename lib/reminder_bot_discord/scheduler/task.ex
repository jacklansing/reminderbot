defmodule ReminderBot.Scheduler.Task do
  alias ReminderBot.Scheduler.ScheduledServices

  defp send_super_early, do: ScheduledServices.send_gw_reminders("super_early")
  defp send_early, do: ScheduledServices.send_gw_reminders("early")
  defp send_late, do: ScheduledServices.send_gw_reminders("late")
  defp send_super_late, do: ScheduledServices.send_gw_reminders("super_late")
end

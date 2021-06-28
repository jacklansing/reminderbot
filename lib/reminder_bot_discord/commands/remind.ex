defmodule ReminderBot.Commands.Remind do
  alias Nostrum.Api
  alias ReminderBot.Tasks

  def get_command do
    %{
      name: "remind",
      description: "Set a Guild War reminder for yourself",
      options: [
        %{
          type: 3,
          name: "reminder_type",
          description:
            "Time you'd like your reminder. Use 'super_early', 'early', 'late', or 'super_late'",
          required: true,
          choices: [
            %{
              name: "Early Morning (9 ET)",
              value: "super_early"
            },
            %{
              name: "Afternoon (13 ET)",
              value: "early"
            },
            %{
              name: "Night (18 ET)",
              value: "late"
            },
            %{
              name: "Late Night (24 ET)",
              value: "super_late"
            }
          ]
        }
      ]
    }
  end

  def handle_interaction(interaction) do
    interaction_data = Enum.at(interaction.data[:options], 0)

    reminder_attrs = %{
      user_id: interaction.member.user.id,
      user_name: interaction.member.user.username,
      channel_id: interaction.channel_id,
      reminder_type: interaction_data.value
    }

    case Tasks.fetch_or_create_reminder(reminder_attrs) do
      {:ok, _reminder} ->
        create_interaction_response(interaction, :new)

      {:existing, reminder} ->
        {:ok, _updated_reminder} = Tasks.update_reminder(reminder, reminder_attrs)
        create_interaction_response(interaction, :existing)

      _ ->
        create_interaction_response(interaction, :error)
    end
  end

  defp get_response(:new), do: "Guild War reminder all set! I'll bother you soon~"
  defp get_response(:existing), do: "Reminder has been updated! I'll bother you soon~"
  defp get_response(_), do: "Something went wrong. Please try again!~"

  defp create_interaction_response(interaction, reponse_type, type \\ 4) do
    Api.create_interaction_response(interaction, %{
      type: type,
      data: %{
        content: get_response(reponse_type)
      }
    })
  end
end

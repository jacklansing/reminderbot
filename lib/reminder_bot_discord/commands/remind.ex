defmodule ReminderBot.Commands.Remind do
  alias Nostrum.Api

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
    Api.create_interaction_response(interaction, %{
      type: 4,
      data: %{
        content: "Guild War reminder all set! I'll bother you soon~"
      }
    })
  end
end

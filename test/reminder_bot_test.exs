defmodule ReminderBotTest do
  use ExUnit.Case
  doctest ReminderBot

  test "greets the world" do
    assert ReminderBot.hello() == :world
  end
end

defmodule LogLevel do
  def to_label(level, legacy?) do
    if legacy? do
      cond do
        level == 1 -> :debug
        level == 2 -> :info
        level == 3 -> :warning
        level == 4 -> :error
        true -> :unknown
      end
    else
      cond do
        level == 0 -> :trace
        level == 1 -> :debug
        level == 2 -> :info
        level == 3 -> :warning
        level == 4 -> :error
        level == 5 -> :fatal
        true -> :unknown
      end
    end
  end

  def alert_recipient(level, legacy?) do
    ops_problems_list = [:error, :fatal]
    cond do
      to_label(level, legacy?) in ops_problems_list -> :ops
      to_label(level, legacy?) == :unknown and legacy? -> :dev1
      to_label(level, legacy?) == :unknown -> :dev2
      true -> false
    end
  end
end

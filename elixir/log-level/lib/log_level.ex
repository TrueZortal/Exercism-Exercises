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
    # Please implement the alert_recipient/2 function
  end
end


# | Log code | Log label | Supported in legacy apps? |
# | -------- | --------- | ------------------------- |
# | 0        | trace     | no                        |
# | 1        | debug     | yes                       |
# | 2        | info      | yes                       |
# | 3        | warning   | yes                       |
# | 4        | error     | yes                       |
# | 5        | fatal     | no                        |
# | ?        | unknown   | -                         |

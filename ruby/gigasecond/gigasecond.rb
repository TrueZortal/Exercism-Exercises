# frozen_string_literal: true

class Gigasecond
  def self.from(given_time)
    Time.at(given_time + 1_000_000_000)
  end
end

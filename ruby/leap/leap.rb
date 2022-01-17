# frozen_string_literal: true

class Year
  def self.leap?(given_value)
    (given_value % 400).zero? || (given_value % 4).zero? && given_value % 100 != 0 ? true : false
  end
end

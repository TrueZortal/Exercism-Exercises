# frozen_string_literal: true

class Year
  def self.leap?(given_value)
    @given_value = given_value.to_i
    divisible_by_4 = (@given_value % 4).zero?
    not_divisible_by_100 = @given_value % 100 != 0
    divisible_by_400 = (@given_value % 400).zero?
    divisible_by_400 || divisible_by_4 && not_divisible_by_100 ? true : false
  end
end

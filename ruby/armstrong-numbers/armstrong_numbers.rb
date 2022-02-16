# frozen_string_literal: true

class ArmstrongNumbers
  def self.include?(number)
    number.digits.map { |a| a**number.digits.length }.sum == number
  end
end

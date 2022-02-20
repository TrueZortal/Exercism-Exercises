# frozen_string_literal: true

class Grains
  def self.square(sqr_number)
    raise ArgumentError unless sqr_number.between?(1, 64)
      sqr_number == 1 ? 1 : 2**(sqr_number - 1)
  end

  def self.total
    values = [1]
    2.upto(64) do |square|
      values << 2**(square - 1)
    end
    values.sum
  end
end

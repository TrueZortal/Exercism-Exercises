# frozen_string_literal: true

class CollatzConjecture
  def self.steps(number)
    raise ArgumentError unless number >= 1

    index = 0
    until number == 1
      number = if number.even?
                 number / 2
               else
                 3 * number + 1
               end
      index += 1
    end
    index
  end
end

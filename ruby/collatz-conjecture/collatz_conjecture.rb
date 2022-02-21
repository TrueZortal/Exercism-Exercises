class CollatzConjecture
  def self.steps(number)
    raise ArgumentError unless number >= 1
    index = 0
      until number == 1
        if number%2 == 0
          number = number/2
          index += 1
        else
          number = 3*number + 1
          index += 1
        end
      end
      index
  end
end


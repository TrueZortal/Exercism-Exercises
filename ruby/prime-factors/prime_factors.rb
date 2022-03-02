require 'prime'

class PrimeFactors
  def self.of(number)
    return [] if number < 2
    factors = []
    index = 2
      while number > 1
        if number % index == 0 and Prime.prime?(index)
          factors << index
          number /= index
        else
          index += 1
        end
      end
    factors
  end

\
end

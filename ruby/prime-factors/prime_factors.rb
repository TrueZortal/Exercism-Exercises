# frozen_string_literal: true

require 'prime'

class PrimeFactors
  def self.of(number)
    @number = number
    generate_an_array_of_primes_upto_number
    @factors = []
    index = 0
    if number == 1
    else
      until @factors.reduce(:*) == number
        index = 0
        index += 1 while @number % @primes[index] != 0
        @factors << @primes[index]
        @number /= @primes[index]
      end
    end
    @factors
  end

  def self.generate_an_array_of_primes_upto_number
    @primes = []
    Prime.each(@number) do |prime|
      @primes << prime
    end
    @primes
  end
end

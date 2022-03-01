require 'prime'

class PrimeFactors

  def self.of(number)
    @number = number
    generate_an_array_of_primes_upto_number
    @factors = []
    index = 0
    if number == 1
      @factors
    else
    until @factors.reduce(:*) == number
      index = 0
      while @number % @primes[index] != 0
          index += 1
      end
      @factors << @primes[index]
      @number /= @primes[index]
    end
     @factors
  end
  end

  def self.generate_an_array_of_primes_upto_number
    @primes = []
    Prime.each(@number) do |prime|
      @primes << prime
    end
    @primes
  end

end


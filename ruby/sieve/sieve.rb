# frozen_string_literal: true

class Sieve
  def initialize(limit)
    @limit = limit
    @full_array = Array(2..limit)
  end

  def primes
    primes = []
    not_primes = []
    @full_array.each do |x|
      if not_primes.include?(x)
        # do nothing
      else
        primes << x
        index = 2
        until x * index > @limit
          not_primes << x * index
          index += 1
        end
      end
    end
    primes
  end
end

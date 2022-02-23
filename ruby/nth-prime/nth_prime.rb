# frozen_string_literal: true

class Prime
  def self.nth(which_prime)
    raise ArgumentError unless which_prime.positive?

    @primes = [2, 3]
    index = @primes.last
    until @primes.length > which_prime
      index += 2
      @primes << index.to_i if check_primacy(index)
    end
    @primes[which_prime - 1]
  end

  def self.check_primacy(prime_question_mark)
    limit = Math.sqrt(prime_question_mark)
    @primes.none? do |x|
      limit < x ? (return true) : (prime_question_mark.to_i % x).zero?
    end
  end
end

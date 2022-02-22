class Prime

  def self.nth(which_prime)
    raise ArgumentError unless which_prime > 0
    @full_array = Array(2..105000)
    @primes = []
    not_primes = []
    @full_array.each do |x|
      if not_primes.include?(x)
        # do nothing
      else
        @primes << x
        index = 2
        until x * index > 105000
          not_primes << x * index
          index += 1
        end
      end
  end
    @primes[which_prime-1]
  end
end
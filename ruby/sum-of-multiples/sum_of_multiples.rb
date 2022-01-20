class SumOfMultiples

  def initialize (*numbers)
    @numbers = numbers
    @array_of_unique_multiples = []
  end

  def to(upper_limit)
    @upper_limit = upper_limit
    @numbers.each do |x|
      array_of_unique_multiples(x)
    end
    @array_of_unique_multiples.sum
  end

  private

  def array_of_unique_multiples(number)
    list_upto_upper_limit = (1..@upper_limit-1).to_a
    list_upto_upper_limit.each do |x|
      if (x % number).zero? && !@array_of_unique_multiples.include?(x)
        @array_of_unique_multiples << x
      end
    end
    @array_of_unique_multiples
  end

end


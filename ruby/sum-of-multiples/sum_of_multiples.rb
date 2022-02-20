# frozen_string_literal: true

class SumOfMultiples
  def initialize(*numbers)
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
    (1..@upper_limit - 1).to_a.each do |x|
      @array_of_unique_multiples << x if (x % number).zero? && !@array_of_unique_multiples.include?(x)
    end
    @array_of_unique_multiples
  end
end

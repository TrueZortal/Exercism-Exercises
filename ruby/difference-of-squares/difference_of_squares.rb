class Squares

  def initialize(upper_limit)
    @array_of_natural_numbers_upto_upper_limit = (0..upper_limit).to_a
  end

  def sum_of_squares
    @array_of_natural_numbers_upto_upper_limit.map { |x| x = x**2}.sum
  end

  def square_of_sum
    @array_of_natural_numbers_upto_upper_limit.sum**2
  end

  def difference
    square_of_sum.to_i - sum_of_squares.to_i
  end

end



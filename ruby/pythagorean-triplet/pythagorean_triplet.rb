# frozen_string_literal: true

class Triplet
  attr_reader :sum, :product

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
    @array_of_sides = [@a, @b, @c]
    @sum = @array_of_sides.sum
    @product = @array_of_sides.reduce(&:*)
  end

  def pythagorean?
    @a**2 + @b**2 == @c**2
  end

  def self.where(max_factor:, sum: nil, min_factor: 1)
    array_of_all_required_values = *(min_factor..max_factor)
    working_array = array_of_all_required_values.combination(3).to_a
    if !sum.nil?
      working_array.keep_if do |x|
        x[0]**2 + x[1]**2 == x[2]**2 && x.sum == sum
      end
    else
      working_array.keep_if do |x|
        x[0]**2 + x[1]**2 == x[2]**2
      end
    end
    working_array.map! { |x| new(x[0], x[1], x[2]) }
  end
end

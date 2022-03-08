class Triplet
  attr_reader :sum

  @@default_values = {
    sum: 0,
    min_factor: 0,
    max_factor: 0
  }

  def initialize(a, b, c)
    @a, @b, @c = a, b, c
    @array_of_sides = [@a, @b, @c]
    @sum = @array_of_sides.sum
  end

  def pythagorean?
    @array_of_sides == @array_of_sides.sort && @a**2 + @b**2 == @c**2
  end

  def self.where(input)
    setup_values = {}
    setup_values = setup_values.merge(@@default_values, input)
    triplets = []
    index = setup_values[:min_factor]
    array_of_all_required_values = *(setup_values[:min_factor]..setup_values[:max_factor])
    working_array = array_of_all_required_values.combination(3).to_a
    if setup_values[:sum] > 0
      working_array.keep_if do |x|
        x == x.sort && x[0]**2 + x[1]**2 == x[2]**2 && x.sum == setup_values[:sum]
      end
    else
      working_array.keep_if do |x|
        x == x.sort && x[0]**2 + x[1]**2 == x[2]**2
      end
    end
    working_array.map! {|x| x = new(x[0],x[1],x[2])}
    working_array
  end

  def product
    @array_of_sides.reduce(&:*)
  end

end

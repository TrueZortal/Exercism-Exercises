class Palindromes
  Palindrome = Struct.new(:value, :factors)

  def initialize(max_factor:, min_factor: 1)
    @working_array = *(min_factor..max_factor)
  end

  def generate
    @all_pairs = @working_array.repeated_combination(2).to_a
    @all_pairs.keep_if do |x|
      x.reduce(&:*).to_s == x.reduce(&:*).to_s.reverse
    end
  end

  def largest
    @all_pairs.keep_if do |x|
      x.reduce(&:*) == @all_pairs.map { |x| x.reduce(&:*)}.max
    end
    max = @all_pairs.max.reduce(&:*)
    Palindrome.new(max, @all_pairs)
  end

  def smallest
    @all_pairs.keep_if do |x|
      x.reduce(&:*) == @all_pairs.map { |x| x.reduce(&:*)}.min
    end
    min = @all_pairs.min.reduce(&:*)
    Palindrome.new(min, @all_pairs)
  end
end


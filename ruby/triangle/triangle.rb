class Triangle
  def initialize (given_input)
    @sides = given_input
  end

  def equilateral?
    self.verify_triangularity_total ? self.unique_entries == 1 : false
  end

  def isosceles?
    if self.verify_triangularity_total
      self.equilateral? ? true : self.unique_entries == 2
    else
      false
    end
  end

  def scalene?
    self.verify_triangularity_total ? self.unique_entries == 3 : false
  end

  def degenerate?
    self.verify_triangularity_total && self.verify_triangular_degeneracy ? true : false
  end

  private

  def unique_entries
    @sides.uniq.count
  end

  def verify_triangularity_total
    self.verify_triangularity_no_zero_sides && self.verify_triangularity_side_length
  end

  def verify_triangularity_no_zero_sides
    @sides.select { |x| x == 0}.empty?
  end

  def verify_triangularity_side_length
    triangularity = String.new
    @sides.each do |x|
      triangularity += (x.to_i <= (@sides.sum.to_i - x.to_i)).to_s + " "
    end
    triangularity.split.all? {|sides| sides == 'true'}
  end

  def verify_triangular_degeneracy
    triangularity = String.new
    @sides.each do |x|
      triangularity += (x == @sides.sum - x).to_s + " "
    end
    triangularity.split.any? {|sides| sides == 'true'}
  end

end


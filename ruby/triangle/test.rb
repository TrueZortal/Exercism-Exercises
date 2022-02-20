# frozen_string_literal: true

class Triangle

  def initialize(given_input)
    @sides = given_input
    @triangles = {
      equilateral: verify_triangularity_total && unique_entries == 1,
      isosceles: verify_triangularity_total && (equilateral? || unique_entries == 2),
      scalene: verify_triangularity_total && unique_entries == 3,
      degenerate: verify_triangularity_total && verify_triangular_degeneracy
    }
    puts @triangles
    end

    @triangles.each do |triangle, test|
      define_method (triangle.to_s+'?') do
        test
      end
    end

  private

  def unique_entries
    @sides.uniq.count
  end

  def verify_triangularity_total
    verify_triangularity_no_zero_sides && verify_triangularity_side_length
  end

  def verify_triangularity_no_zero_sides
    @sides.select(&:zero?).empty?
  end

  def verify_triangularity_side_length
    triangularity = String.new
    @sides.each do |x|
      triangularity += "#{x.to_i <= (@sides.sum.to_i - x.to_i)} "
    end
    triangularity.split.all? { |sides| sides == 'true' }
  end

  def verify_triangular_degeneracy
    triangularity = String.new
    @sides.each do |x|
      triangularity += "#{x == @sides.sum - x} "
    end
    triangularity.split.any? { |sides| sides == 'true' }
  end

end

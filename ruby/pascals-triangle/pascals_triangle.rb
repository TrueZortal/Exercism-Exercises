# frozen_string_literal: true

class Triangle
  def initialize(num_of_rows)
    @num_of_rows = num_of_rows
    build
  end

  def rows
    @triangulated_rows
  end

  private

  def build
    @triangulated_rows = [[1]]
    2.upto(@num_of_rows) do |index|
      @row = []
      fill(@triangulated_rows[index - 2]) if index > 2
      add_leading_trailing_ones
      @triangulated_rows << @row
    end
  end

  def fill(row)
    row.each_with_index do |number, inner_index|
      @row << number + row[inner_index + 1] if inner_index <= row.size - 2
    end
  end

  def add_leading_trailing_ones
    one = 1
    @row << one
    @row.unshift(one)
  end
end

# frozen_string_literal: true

class Matrix
  attr_reader :rows, :columns

  def initialize(matrix)
    @rows = matrix.lines.map { |x| x.strip.split(' ').map(&:to_i) }
    @columns = @rows.transpose
  end

  def saddle_points
    array_of_saddle_points = []
    @rows.each_with_index do |row, row_index|
      row.each_with_index do |number, column|
        if number == @columns[column].min { |a, b| a <=> b } && number == row.max { |a, b| a <=> b }
          array_of_saddle_points << [row_index, column]
        end
      end
    end
    array_of_saddle_points
  end
end

# frozen_string_literal: true

class Matrix
  attr_reader :rows

  def initialize(given_input)
    @rows = given_input.split(/\n/).map { |x| x.strip.split(' ').map(&:to_i) }
  end

  def columns
    index = 0
    all_columns = []
    1.upto(@rows.max.length) do
      individual_column = []
      @rows.each do |row|
        individual_column << row[index]
      end
      all_columns << individual_column
      index += 1
    end
    all_columns
  end
end

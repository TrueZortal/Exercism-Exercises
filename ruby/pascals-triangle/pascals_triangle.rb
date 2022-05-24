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
    i = 2

    2.upto(@num_of_rows) do |index|
      @row = []
      if index > 2
        fill(@triangulated_rows[index-2])
      end
      add_leading_trailing_ones
      @triangulated_rows << @row
    end
  end

  def fill(row)
    row.each_with_index do |number, inner_index|
      if inner_index <= row.size - 2
        @row << number + row[inner_index + 1]
      end
    end
  end

  def add_leading_trailing_ones
    one = 1
    @row << one
    @row.unshift(one)
  end
end
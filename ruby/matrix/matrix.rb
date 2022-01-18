class Matrix

  attr_reader :rows
  attr_reader :columns

  def initialize(given_input)
  @rows = given_input.lines.map { |i| i.split.map(&:to_i)}
  @columns = @rows.transpose
  end
end


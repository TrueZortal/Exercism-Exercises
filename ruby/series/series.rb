class Series
  def initialize(string)
    @string = string
  end

  def slices(x)
    max_index = @string.length - x
    raise ArgumentError unless max_index >= 0
      temp = []
      0.upto(max_index) do |index|
      temp << @string[index, x]
  end
  temp
end
end

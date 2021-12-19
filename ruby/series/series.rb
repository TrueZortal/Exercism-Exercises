class Series
  def initialize(string)
    @string = string
  end

  def slices(x)
    error = @string.length - x
    if error < 0 then
      raise ArgumentError
    else
      temp = []
      0.upto(error) do |index|
      temp << @string[index, x]
    end
  end
  temp
end
end

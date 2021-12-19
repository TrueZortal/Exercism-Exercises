class Series
  def initialize(string)
    @string = string
  end
  def slices(x)
    array = @string.scan(/\w/)
    result = []
    max_value = array.length - x
    counter = 0
    if max_value < 0
      raise ArgumentError
    else
    until counter > max_value
      result << @string[counter,x]
      counter += 1
    end
    end
    result
  end
end




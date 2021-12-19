class Series
  def initialize(string)
    puts string
    @string = string.scan(/\w/).map {|x| x.to_i}
    # puts "ile elementow w oryginalnym entry"
    # puts @string.count
    # puts "@string"
    #puts @string
  end
  def slices(x)
    temp = []
    @string.each {|series| temp << @string[series..series+x] }
    # puts "ile elementow"
    # puts temp.count
    # puts "temp"
    # puts temp
  end

end

Series.new('98273463').slices(1)

#puts series.slices(1)
class Hamming
  def self.compute(text1, text2)
    @text1 = text1.scan(/\w/)
    @text2 = text2.scan(/\w/)
    raise ArgumentError unless @text1.length == @text2.length
    index = 0
    hamming = 0
    while index < @text1.length do
      if @text1[index] != @text2[index]
        hamming += 1
        index += 1
      else
        index += 1
      end
    end
    hamming
  end
end




class Hamming
  def initialize
  end
  def self.compute(text1, text2)
    @text1 = text1.to_s
    @text2 = text2.to_s
    raise ArgumentError unless @text1.length == @text2.length
    sequence1 = @text1.scan(/\w/)
    sequence2 = @text2.scan(/\w/)
    index = 0
    hamming = 0
    while index < @text1.length do
      if sequence1[index] != sequence2[index]
        hamming += 1
        index += 1
      else
        index += 1
      end
    end
    hamming
  end
end




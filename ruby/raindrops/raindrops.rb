class Raindrops
  def self.convert(number)
    @number = number
    result = String.new
   if @number.modulo(3) == 0
     result += "Pling"
   end
   if @number.modulo(5) == 0
    result += "Plang"
   end
   if @number.modulo(7) == 0
    result += "Plong"
   end
   result.empty? ? "#{number}" : result
  end
end



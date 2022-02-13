# class Transpose
#   def self.transpose(given_input)
#     if given_input.empty?
#       given_input
#     else
#     @array = given_input.split("\n")
#     result = String.new
#     i = 0
#     if @array.length > @array.max.length
#       until i > @array.length
#         @array.each do |x|
#           if i < x.length
#           result += x[i].to_s
#         elsif i == x.length && x != @array.last
#           result += ' '
#           end
#         end
#         i += 1
#         if i < @array.length && @array.max.length != 1
#           result += "\n"
#         end
#       end
#     else
#       until i > @array.max.length-1
#         @array.each do |x|
#             if i < x.length
#             result += x[i].to_s
#             elsif i == x.length && x != @array.last
#             result += ' '
#             end
#         end
#         i += 1
#         if i < @array.max.length
#           result += "\n"
#         end
#       end
#     end
#     result
#   end
# end
# end


# class Transpose
#   def self.transpose(given_input)
#       @array = given_input.split("\n").map {|x| x.chars}
#       make_equal
#       process
#       display
#       # putsalot
#   end

#   private

#   def self.make_equal
#     @array.each do |x|
#       if x.length < @array.max.length
#         spaces = (@array.max.length - x.length)
#         # puts "#{x} is smaller than #{@array.max.length}"
#         1.upto(spaces) do x << ' '
#         end
#       end
#       end
#   end

#   def self.display
#     @array.join
#   end

#   def self.putsalot
#     @array.each do |x|
#     puts "Position #{x} has #{x.length} length"
#     end
#   end
#   def self.process
#     # @array[0].map {|char| what(char)}
#       number_of_rows = *(1..@array.length-1)
#       @array[0].each do |x|
#         x = x << @array[1][0] << @array[2][0]
#     end
#   end
#   # def self.what(char)
#   #   number_of_rows = *(1..@array.length-1)
#   #   length_of_strings = *(0..@array.max.length-1)
#   #   number_of_rows.each do |x|
#   #     length_of_strings.each do |y|
#   #       char += @array[x][y]
#   #     end
#   #   end
#   # end
# end


input = "AAA\nBBB\nCCCC"
# input = "T\nEE\nAAA\nSSSS\nEEEEE\nRRRRRR"
# #     expected = "TT\nhh\nee\n  \nff\noi\nuf\nrt\nth\nh \n l\nli\nin\nne\ne.\n."

Transpose.transpose(input)


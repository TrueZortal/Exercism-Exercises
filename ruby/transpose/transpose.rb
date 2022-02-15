require 'byebug'

class Transpose
  def self.transpose(given_input)
    @given_input = given_input
    if @given_input == ""
      @given_input
    else
    transpose_input
    end
  end

  private

  def self.separate_into_an_array_of_chars
    @array_of_chars = @given_input.split("\n").map {|x| x.chars}
  end

  def self.max_array
    @given_input.split("\n").max {|a,b| a.length <=> b.length}.length
  end

  def self.fill_with_spaces_for_display
    @array_of_chars.each do |inner_array|
      if @array_of_chars[@array_of_chars.index(inner_array)+1].nil?
        #do nothing
      # elsif @array_of_chars[@array_of_chars.index(inner_array)+1].length - @array_of_chars[@array_of_chars.index(inner_array)].length > 0
      #   1.upto(@array_of_chars[@array_of_chars.index(inner_array)+1].length - @array_of_chars[@array_of_chars.index(inner_array)].length) do
      #   @array_of_chars[@array_of_chars.index(inner_array)] << '$'
      #   end
      elsif @array_of_chars[@array_of_chars.index(inner_array)..@array_of_chars.index(@array_of_chars.last)].max {|a,b| a.length <=> b.length}.length - @array_of_chars[@array_of_chars.index(inner_array)].length  > 0
          1.upto(@array_of_chars[@array_of_chars.index(inner_array)..@array_of_chars.index(@array_of_chars.last)].max {|a,b| a.length <=> b.length}.length - @array_of_chars[@array_of_chars.index(inner_array)].length) do
            @array_of_chars[@array_of_chars.index(inner_array)] << ' '
          end
      end
    end
  end

  # def self.find_if_current_iteration_of_inner_array_is_the_longest_remaining(value)
  #   @array_of_chars[@array_of_chars.index(value)..@array_of_chars.index(@array_of_chars.last)].max {|a,b| a.length <=> b.length}.length > @array_of_chars[@array_of_chars.index(value)].length
  # end


  def self.transpose_input
    @output = String.new
    @index = 0
    separate_into_an_array_of_chars
    fill_with_spaces_for_display
    until @index == max_array
    @array_of_chars.each do |inner_array|
      if inner_array[@index] == nil #&& find_if_current_iteration_of_inner_array_is_the_longest_remaining(inner_array)
        # @output << '-'
        # puts @array_of_chars.index(@array_of_chars.last)
        # puts @array_of_chars[@array_of_chars.index(inner_array)..@array_of_chars.index(@array_of_chars.last)].max {|a,b| a.length <=> b.length}.length
        # puts @array_of_chars[@array_of_chars.index(inner_array)].length
      elsif inner_array[@index] == nil
        # @output << '#'
        # puts "#"
        # puts @array_of_chars[@array_of_chars.index(inner_array)..@array_of_chars.index(@array_of_chars.last)].max {|a,b| a.length <=> b.length}.length
        # puts @array_of_chars[@array_of_chars.index(inner_array)].length
        # puts @array_of_chars[@array_of_chars.index(inner_array)..@array_of_chars.index(@array_of_chars.last)].max.length > @array_of_chars[@array_of_chars.index(inner_array)].length
        # do nothing
      else
        @output << "#{inner_array[@index]}"
      end
    end
    @index += 1
    if @index < max_array
      @output << "\n"
    else
      #do nothing
    end
  end
    @output
  end
end

# input = "T\nEE\nAAA\nSSSS\nEEEEE\nRRRRRR"
# input = "The longest line.\nA long line.\nA longer line.\nA line."
# input = "123\nABCDE\nYO\nXYZXYZ"
# input = "abc\n1234\n$$$$$$$$\nXYZ"

"TAAA\nh   \nelll\n ooi\nlnnn\nogge\nn e.\nglr\nei \nsnl\ntei\n .n\nl e\ni .\nn\ne\n."
    # expected =
    "TAAA\n x
    h   \n x
    elll\n x
     ooi\n x
     lnnn\n x
     ogge\n x
     n e.\n x
     glr\n x
     ei \n x
     snl\n x
     tei\n x
      .n\n x
      l e\n x
      i .\n x
      n\n x
      e\n x
      ."

  # Transpose.transpose(input)
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

  def self.separate_into_arrays_of_chars
    @given_input.split("\n").map {|x| x.chars}
  end

  def self.max_array
   @given_input.split("\n").max {|a,b| a.length <=> b.length}.length
  end

  def self.find_if_inner_array_is_shorter_than_next_element(value)
    separate_into_arrays_of_chars[separate_into_arrays_of_chars.index(value)].length > separate_into_arrays_of_chars[separate_into_arrays_of_chars.index(value)+1].length
  end

  def self.transpose_input
    test_var = separate_into_arrays_of_chars
    @output = String.new
    index = 0
    until index == max_array
    separate_into_arrays_of_chars.each do |inner_array|
      if inner_array[index] == nil && inner_array != separate_into_arrays_of_chars.last
        @output << ' '
      else
      @output << "#{inner_array[index]}"
      end
    end
    index += 1
    if index < max_array
      @output << "\n"
    else
      #do nothing
    end
  end
  @output
  end
end

# input = "T\nEE\nAAA\nSSSS\nEEEEE\nRRRRRR"
input = "The longest line.\nA long line.\nA longer line.\nA line."
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

  Transpose.transpose(input)
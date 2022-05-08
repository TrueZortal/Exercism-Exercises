class OcrNumbers

  @@dictionary = {
    " _ \n| |\n|_|\n   " => 0,
    "   \n  |\n  |\n   " => 1,
    " _ \n _|\n|_ \n   " => 2,
    " _ \n _|\n _|\n   " => 3,
    "   \n|_|\n  |\n   " => 4,
    " _ \n|_ \n _|\n   " => 5,
    " _ \n|_ \n|_|\n   " => 6,
    " _ \n  |\n  |\n   " => 7,
    " _ \n|_|\n|_|\n   " => 8,
    " _ \n|_|\n _|\n   " => 9
  }
  def self.convert(string)
    if string.lines.size > 4
      char_groups = []
       string.lines.each_slice(4).each do |group_of_chars|
        char_groups << convert_input_into_character_inputs(group_of_chars.map(&:chomp))
       end
       answer = []
       char_groups.each do |group|
        answer << translate_each_character(group)
       end
       answer.join(",")
    else
      characters = convert_input_into_character_inputs(string.lines.map(&:chomp))
      translate_each_character(characters)
    end
  end

  def self.translate_each_character(array_of_characters)
    answer = []
    array_of_characters.each do |character|
      if character.lines.size % 4 != 0 || character.lines[0].length != 4
        raise ArgumentError
      elsif @@dictionary.include?(character)
        answer << @@dictionary[character]
      else
        answer << '?'
      end
    end
    answer.join
  end
  def self.convert_input_into_character_inputs(lines_of_input)
    individual_inputs = []
    lines_of_input.each do |line|
      individual_inputs << line.chars.each_slice(3).map(&:join)
    end
    individual_inputs.transpose.map {|elems_of_char|  elems_of_char.join("\n")}
  end
end

input = ["    _  _ ",
  "  | _| _|",
  "  ||_  _|",
  "         ",
  "    _  _ ",
  "|_||_ |_ ",
  "  | _||_|",
  "         ",
  " _  _  _ ",
  "  ||_||_|",
  "  ||_| _|",
  "         "].join("\n")
OcrNumbers.convert(input)
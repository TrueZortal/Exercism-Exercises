# frozen_string_literal: true

class OcrNumbers
  @dictionary = {
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
    bulk_translate_each_line_of_character_inputs(convert_into_lines_of_character_inputs(string))
  end

  def self.convert_into_lines_of_character_inputs(string)
    char_groups = []
    string.lines.each_slice(4).each do |group_of_chars|
      char_groups << convert_input_into_character_inputs(group_of_chars.map(&:chomp))
    end
    char_groups
  end

  def self.bulk_translate_each_line_of_character_inputs(array_of_lines_of_inputs)
    answer = []
    array_of_lines_of_inputs.each do |group|
      answer << translate_each_character(group)
    end
    answer.join(',')
  end

  def self.translate_each_character(array_of_characters)
    translated_characters = []
    array_of_characters.each do |character|
      raise ArgumentError if character.lines.size % 4 != 0 || character.lines[0].length != 4

      translated_characters << if @dictionary.include?(character)
                                 @dictionary[character]
                               else
                                 '?'
                               end
    end
    translated_characters.join
  end

  def self.convert_input_into_character_inputs(lines_of_input)
    individual_inputs = []
    lines_of_input.each do |line|
      individual_inputs << line.chars.each_slice(3).map(&:join)
    end
    individual_inputs.transpose.map { |elems_of_char| elems_of_char.join("\n") }
  end
end

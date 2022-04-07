# frozen_string_literal: true

class PigLatin
  @vowel_sounds = %w[a e i o u xr yt]
  @consonant_sounds = %w[p f k y x q m r h s ch qu th thr sch]
  class << self
    def translate(input)
      @input = input.split(' ')
      actually_translate(@input)
    end

    private

    def actually_translate(array)
      answer = String.new
      array.each do |elem|
        if starts_with_vowel_sound?(elem)
          answer += more_than_1_elem?(array) ? "#{modify_for_vowel_start(elem)} " : modify_for_vowel_start(elem)
        elsif starts_with_consonant_sound?(elem)
          answer += more_than_1_elem?(array) ? "#{modify_for_consonants(elem)} " : modify_for_consonants(elem)
        end
      end
      more_than_1_elem?(array) ? answer.chomp!(' ') : answer
    end

    def more_than_1_elem?(array)
      array.size > 1
    end

    def starts_with_vowel_sound?(string)
      @vowel_sounds.include?(string[0]) || @vowel_sounds.include?(string[0..1])
    end

    def starts_with_consonant_sound?(string)
      @consonant_sounds.include?(string[0]) ||
        @consonant_sounds.include?(string[0..1]) ||
        @consonant_sounds.include?(string[0..2])
    end

    def qu_after_a_consonant_start?(string)
      string[1..2] == 'qu'
    end

    def y_after_a_block_of_consonants?(string)
      return false if string.chars.none? { |x| x == 'y' }

      string[0..string.chars.find_index('y') - 1].chars.all? { |x| @consonant_sounds.include?(x) }
    end

    def y_second_in_two_letter_word?(string)
      string.size == 2 && string[1] == 'y'
    end

    def modify_for_a_consonant_start_with_qu(string)
      "#{string[3, string.size]}#{string[0..2]}ay"
    end

    def modify_for_vowel_start(string)
      "#{string}ay"
    end

    def modify_for_y_second_in_two_letter_word(string)
      "y#{string[0]}ay"
    end

    def modify_for_y_after_a_block_of_consonants(string)
      "#{string[string.chars.find_index('y')..string.length]}#{string[0..string.chars.find_index('y') - 1]}ay"
    end

    def modify_for_consonant_start(string)
      if @consonant_sounds.include?(string[0..2])
        "#{string[3, string.size]}#{string[0..2]}ay"
      elsif @consonant_sounds.include?(string[0..1])
        "#{string[2, string.size]}#{string[0..1]}ay"
      else
        "#{string[1, string.size]}#{string.chr}ay"
      end
    end

    def modify_for_consonants(string)
      if y_second_in_two_letter_word?(string)
        modify_for_y_second_in_two_letter_word(string)
      if y_after_a_block_of_consonants?(string)
        modify_for_y_after_a_block_of_consonants(string)
      elsif qu_after_a_consonant_start?(string)
        modify_for_a_consonant_start_with_qu(string)
      else
        modify_for_consonant_start(string)
      end
    end
  end
end

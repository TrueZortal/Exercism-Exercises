# frozen_string_literal: true

class Anagram
  def initialize(anagram)
    @anagram = anagram.downcase
    @anagram_array = @anagram.chars.sort
  end

  def match(list_to_test_against)
    result = []
    list_to_test_against.each do |x|
      if x.downcase == @anagram
        # do nothing
      elsif x.downcase.chars.sort == @anagram_array
        result << x
      end
    end
    result
  end
end

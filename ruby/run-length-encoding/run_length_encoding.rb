# frozen_string_literal: true

class RunLengthEncoding
  def self.encode(string)
    @string = string.chars
    @answer = []
    @char_set = []
    @string.each_with_index do |char, index|
      if !@char_set.empty? && !@char_set.include?(char)
        @answer << if @char_set.size == 1
                     @char_set.join
                   else
                     "#{@char_set.size}#{@char_set[0]}"
                   end
        @char_set = []
        @char_set << char
      else
        @char_set << char
        if index + 1 == @string.size
          @answer << "#{@char_set.size}#{@char_set[0]}"
          @char_set = []
        end
      end
    end
    @answer << @char_set unless @char_set.empty?
    @answer.join
  end

  def self.decode(code)
    @code = code.chars
    @deciphered = []
    @code.each_with_index do |char, index|
      if @code[index - 1].to_i != 0
        next
      elsif char.to_i != 0 && @code[index + 1].to_i.zero?
        @deciphered << @code[index + 1] * char.to_i
      elsif char.to_i != 0 && @code[index + 1].to_i != 0
        @deciphered << @code[index + 2] * (char.to_i * 10 + @code[index + 1].to_i * 1)
      else
        @deciphered << char
      end
    end
    @deciphered.join
  end
end

class Diamond
  def self.make_diamond(letter)
    @letters = *('A'..letter)
    @offset = @letters.size - 1
    answer = String.new
    @space_or_other_char_if_needed = ' '
    @letters.each_with_index do |letter, index|
      answer << "#{outer(index)}#{inner(letter, index)}#{outer(index)}\n"
      @index = index
    end
    @index -= 1
    @letters[0..@index].reverse.each do |letter|
      break if @index < 0

      answer << "#{outer(@index)}#{inner(letter, @index)}#{outer(@index)}\n"
      @index -= 1
    end
    answer
  end

  private

  def self.outer(value)
    @space_or_other_char_if_needed * (@offset - value)
  end

  def self.inner(value, index)
    value == 'A' ? value : "#{value}#{@space_or_other_char_if_needed * ((index * 2)-1)}#{value}"
  end
end



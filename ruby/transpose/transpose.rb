# frozen_string_literal: true

class Transpose
  def self.transpose(given_input)
    @given_input = given_input
    if @given_input == ''
      @given_input
    else
      transpose_input
    end
  end

  private

  def self.separate_into_an_array_of_chars
    @array_of_chars = @given_input.split("\n").map(&:chars)
  end

  def self.max_array
    @given_input.split("\n").max { |a, b| a.length <=> b.length }.length
  end

  def self.fill_with_spaces_for_display
    @array_of_chars.each do |inner_array|
      if @array_of_chars[@array_of_chars.index(inner_array) + 1].nil?
      # do nothing
      elsif (@array_of_chars[@array_of_chars.index(inner_array)..@array_of_chars.index(@array_of_chars.last)].max do |a, b|
               a.length <=> b.length
             end.length - @array_of_chars[@array_of_chars.index(inner_array)].length).positive?
        1.upto(@array_of_chars[@array_of_chars.index(inner_array)..@array_of_chars.index(@array_of_chars.last)].max do |a, b|
                 a.length <=> b.length
               end.length - @array_of_chars[@array_of_chars.index(inner_array)].length) do
          @array_of_chars[@array_of_chars.index(inner_array)] << ' '
        end
      end
    end
  end

  def self.transpose_input
    @output = String.new
    @index = 0
    separate_into_an_array_of_chars
    fill_with_spaces_for_display
    until @index == max_array
      @array_of_chars.each do |inner_array|
        case inner_array[@index]
        when nil
          # do nothing
        else
          @output << (inner_array[@index]).to_s
        end
      end
      @index += 1
      if @index < max_array
        @output << "\n"
      end
    end
    @output
  end
end

# frozen_string_literal: true

class IsbnVerifier
  def self.valid?(isbn)
    @isbn = isbn.split(/[^0-9X]/).join.chars.reverse
    verification_array = []
    i = 1
    if @isbn.include?('X') && @isbn.index('X') != 0 || @isbn.length != 10
      return false
    else
      @isbn = @isbn.map { |x| x == 'X' ? '10' : x }
      @isbn.each do |x|
        verification_array << x.to_i * i
        i += 1
      end
    end

    (verification_array.sum % 11).zero?
  end
end

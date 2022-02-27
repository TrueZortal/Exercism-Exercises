# frozen_string_literal: true

class RotationalCipher
  numbers = *(0..25)
  alphabet = *('a'..'z')
  @@alphabet_numbers_match = numbers.zip(alphabet).to_h

  def self.rotate(message, rotation)
    transcribed_message = String.new
    message.chars.each do |x|
      if x.split(/[^a-zA-Z]/).empty?
        transcribed_message << x
      elsif x == x.downcase
        transcribed_message << @@alphabet_numbers_match[(@@alphabet_numbers_match.key(x) + rotation) % 26]
      elsif x == x.upcase
        transcribed_message << @@alphabet_numbers_match[(@@alphabet_numbers_match.key(x.downcase) + rotation) % 26].upcase
      end
    end
    transcribed_message
  end
end

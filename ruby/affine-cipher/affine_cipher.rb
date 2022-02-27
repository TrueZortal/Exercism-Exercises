# frozen_string_literal: true

class Affine
  numbers = *(0..25)
  alphabet = *('a'..'z')
  @@alphabet_numbers_match = numbers.zip(alphabet).to_h

  def initialize(prime, coprime)
    @prime = prime
    @coprime = coprime
    calculate_mmi
  end

  def calculate_mmi
    index = 0
    until index * @prime % @@alphabet_numbers_match.length == 1
      index += 1
      raise ArgumentError if index >= 400
    end
    index
  end

  def encode(text)
    encoded_text = []
    array_of_plain_text = text.split(/[^a-zA-Z0-9]/).join.chars.each do |x|
      encoded_text << if x.to_i.zero? && x != '0'
                        @@alphabet_numbers_match[(@prime * @@alphabet_numbers_match.key(x.downcase) + @coprime) % 26]
                      else
                        x
                      end
    end
    if encoded_text.length <= 5
      encoded_text.join
    else
      encoded_text.join.scan(/.{5}|.+/).join(' ')
    end
  end

  def decode(code)
    mmi = calculate_mmi
    array_of_chars_of_code = code.split(' ').join.chars
    decoded_text = []
    array_of_chars_of_code.each do |x|
      decoded_text << if x.to_i.zero? && x != '0'
                        @@alphabet_numbers_match[(mmi * (@@alphabet_numbers_match.key(x).to_i - @coprime)) % 26]
                      else
                        x
                      end
    end
    decoded_text.join
  end
end

# frozen_string_literal: true

class Integer
  def to_roman
    alphabet = {
      1 => 'I',
      5 => 'V',
      10 => 'X',
      50 => 'L',
      100 => 'C',
      500 => 'D',
      1000 => 'M'
    }

    number = self
    digits_of_number = number.digits
    converted_number = []
    exponent = 1
    digits_of_number.each do |x|
      if x <= 3
        1.upto(x) do
          converted_number << exponent.to_i
        end
      elsif x == 4
        converted_number << exponent.to_i * 5
        converted_number <<  exponent.to_i
      elsif x == 5
        converted_number << (exponent * 5)
      elsif x <= 8
        1.upto(x - 5) do
          converted_number << exponent
        end
        converted_number << (exponent * 5).to_i
      elsif x == 9
        converted_number << (exponent.to_i * 10)
        converted_number <<  exponent.to_i
      end
      exponent *= 10
    end
    converted_number.map { |x| alphabet[x] }.reverse.join
  end
end

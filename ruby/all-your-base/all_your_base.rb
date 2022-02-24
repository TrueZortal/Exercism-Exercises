# frozen_string_literal: true

class BaseConverter
  def self.convert(input_base, digits, output_base)
    raise ArgumentError unless input_base > 1 && output_base > 1 && digits.none?(&:negative?) && digits.all? do |x|
                                 x < input_base
                               end

    @input_base = input_base
    @digits = digits
    @output_base = output_base
    if output_base == 10 || digits.all?(0)
      convert_to_decimal.digits.reverse
    else
      convert_to_output_base
    end
  end

  def self.convert_to_decimal
    @digits.reverse.map.with_index { |x, i| x * (@input_base**i) }.sum
  end

  def self.length_of_output
    @length_of_output = 0
    @length_of_output += 1 while convert_to_decimal > 1 * (@output_base**@length_of_output)
    @max_exponent = @length_of_output - 1
  end

  def self.convert_to_output_base
    remainder = convert_to_decimal
    length_of_output
    converted = []
    @number = 0
    while converted.length < @length_of_output
      @number += 1 while remainder >= @number * (@output_base**@max_exponent)
      @number -= 1
      if remainder - @number * (@output_base**@max_exponent) >= 0
        converted << @number
        remainder -= @number * (@output_base**@max_exponent)
      else
        converted << 0
      end
      @max_exponent -= 1
      @number = 0
    end
    converted
  end
end

# frozen_string_literal: true

class Say
  def initialize(number)
    raise ArgumentError if number.negative? || number > 999_999_999_999

    @dictionary_of_numbers = {
      0 => 'zero',
      1 => 'one',
      2 => 'two',
      3 => 'three',
      4 => 'four',
      5 => 'five',
      6 => 'six',
      7 => 'seven',
      8 => 'eight',
      9 => 'nine'
    }

    @tens = {
      2 => 'twenty',
      3 => 'thirty',
      4 => 'forty',
      5 => 'fifty',
      6 => 'sixty',
      7 => 'seventy',
      8 => 'eighty',
      9 => 'ninety'
    }

    @numbers = number.digits.each_slice(3).to_a.map(&:join)
  end

  def in_english
    answer = String.new
    orders_of_magnitude_i_guess = [
      'billion',
      'million',
      'thousand',
      ''
    ]

    index_of_magnitude =  case @numbers.size
                          when 1
                            3
                          when 2
                            2
                          when 3
                            1
                          when 4
                            0
                          end

    @numbers.reverse.each do |group_of_something|
      group_of_something = group_of_something.reverse.to_i
      if group_of_something.zero? && (@numbers.size > 1)
        # do nothing
      elsif group_of_something < 10
        answer << @dictionary_of_numbers[group_of_something]
      elsif group_of_something > 10 && group_of_something < 20
        answer << "#{@dictionary_of_numbers[group_of_something.digits.first]}teen"
      elsif group_of_something >= 20 && group_of_something < 100
        answer << "#{@tens[group_of_something.digits.last]}#{group_of_something.digits.first.zero? ? '' : "-#{@dictionary_of_numbers[group_of_something.digits.first]}"}"
      elsif group_of_something >= 100 && group_of_something < 1000
        answer << "#{@dictionary_of_numbers[group_of_something.digits.last]} hundred#{group_of_something.digits[1].zero? ? '' : " #{@tens[group_of_something.digits[1]]}"}#{group_of_something.digits.first.zero? ? '' : "-#{@dictionary_of_numbers[group_of_something.digits.first]}"}"
      end

      answer << ' ' if index_of_magnitude != 3

      answer << orders_of_magnitude_i_guess[index_of_magnitude].to_s if group_of_something != 0
      index_of_magnitude += 1
      answer << ' '
    end
    answer.strip
  end
end

class Say

  @@numbers = {
    0 => 'zero',
    1 => 'one' ,
    2 => 'two',
    3 => 'three',
    4 => 'four',
    5 => 'five',
    6 => 'six',
    7 => 'seven',
    8 => 'eight',
    9 => 'nine'
  }

  @@tens = {
    2 => 'twenty',
    3 => 'thirty',
    4 => 'forty',
    5 => 'fifty',
    6 => 'sixty',
    7 => 'seventy',
    8 => 'eighty',
    9 => 'ninety',
  }
  def initialize(number)
    raise ArgumentError if number < 0 || number > 999_999_999_999
    @numbers = number.digits.each_slice(3).to_a.map(&:join)
    # p @numbers
  end

  def in_english
    answer = String.new
    orders_of_magnitude_i_guess = [
      'billion',
      'million',
      'thousand',
      ''
    ]

    index_of_magnitude =  if @numbers.size == 1
                            3
                          elsif @numbers.size == 2
                            2
                          elsif @numbers.size == 3
                            1
                          elsif @numbers.size == 4
                            0
                          end

    @numbers.reverse.each do |group_of_something|
      group_of_something = group_of_something.reverse.to_i
    if group_of_something.zero? and @numbers.size > 1
      #do nothing
    elsif group_of_something < 10
      answer << @@numbers[group_of_something]
    elsif group_of_something > 10 && group_of_something < 20
      answer << "#{@@numbers[group_of_something.digits.first]}teen"
    elsif group_of_something >= 20 && group_of_something < 100
      answer << "#{@@tens[group_of_something.digits.last]}#{group_of_something.digits.first.zero? ? "" : "-#{@@numbers[group_of_something.digits.first]}"}"
    elsif group_of_something >= 100 && group_of_something < 1000
      answer << "#{@@numbers[group_of_something.digits.last]} hundred#{group_of_something.digits[1].zero? ? "" : " #{@@tens[group_of_something.digits[1]]}"}#{group_of_something.digits.first.zero? ? "" : "-#{@@numbers[group_of_something.digits.first]}"}"
    end

    if index_of_magnitude != 3
      answer << ' '
    end

    if group_of_something != 0
      answer << orders_of_magnitude_i_guess[index_of_magnitude].to_s
    end
      index_of_magnitude += 1
      answer << ' '
    end
    answer.strip
  end
end



# number = 1_666_666_666

#  Say.new(number).in_english
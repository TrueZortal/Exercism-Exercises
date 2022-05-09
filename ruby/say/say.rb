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
    4 => 'fourty',
    5 => 'fifty',
    6 => 'sixty',
    7 => 'seventy',
    8 => 'eighty',
    9 => 'ninety',
  }
  def initialize(number)
    @number = number
  end

  def in_english
    answer = String.new
    if @number < 10
      answer << @@numbers[@number]
    elsif @number > 10 && @number < 20
      answer << "#{@@numbers[@number.digits.first]}teen"
    elsif @number >= 20 && @number < 100
      answer << "#{@@tens[@number.digits.last]}#{@number.digits.first.zero? ? "" : "-#{@@numbers[@number.digits.first]}"}"
    elsif @number >= 100 && @number < 1000

    end
    answer
  end
end




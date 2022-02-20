class Grains
  def self.square(sqr_number)
    if sqr_number.between?(1, 64)
      sqr_number == 1 ? 1 : 2**(sqr_number-1)
    else
      raise ArgumentError
    end
  end

  def self.total
    squares_on_the_board = Array(1..64)
    values = []
    squares_on_the_board.each do |square|
      square == 1 ? values << 1 : values << 2**(square-1)
    end
    values.sum
  end
end


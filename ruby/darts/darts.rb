# frozen_string_literal: true

class Darts
  def initialize(x, y)
    @x = x
    @y = y
    @r = Math.sqrt(@x**2 + @y**2)
  end

  def score
    if @r <= 1
      10
    elsif @r > 1 && @r <= 5
      5
    elsif @r > 5 && @r <= 10
      1
    else
      0
    end
  end
end

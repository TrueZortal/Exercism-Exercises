class Robot
  attr_reader :bearing, :coordinates

  DIRECTIONS = {west: -1, north:+1, east: +1, south: -1}

  def initialize
  end

  def orient(direction)
    raise ArgumentError unless DIRECTIONS.keys.include?(direction)
    @bearing = direction
  end

  def at(x,y)
    @coordinates = [x, y]
  end

  def axis
    x = [0,2]
    y = [1,3]
    if x.include?(DIRECTIONS.keys.index(@bearing))
      0
    else
      1
    end
  end

  def advance
    @coordinates[axis] += DIRECTIONS[@bearing]
  end

  def turn_right
    @bearing = DIRECTIONS.keys[(DIRECTIONS.keys.index(@bearing)+1) % 4]

  end

  def turn_left
    @bearing = DIRECTIONS.keys[(DIRECTIONS.keys.index(@bearing)-1) % 4]
  end

end

class Simulator
  def initialize
  end
end
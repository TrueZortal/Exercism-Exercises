# frozen_string_literal: true

class Robot
  attr_reader :bearing, :coordinates

  DIRECTIONS = { west: -1, north: +1, east: +1, south: -1 }.freeze

  def initialize
    @bearing = nil
    @coordinates = nil
  end

  def orient(direction)
    raise ArgumentError unless DIRECTIONS.keys.include?(direction)

    @bearing = direction
  end

  def at(x, y)
    @coordinates = [x, y]
  end

  def axis
    x = [0, 2]
    y = [1, 3]
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
    @bearing = DIRECTIONS.keys[(DIRECTIONS.keys.index(@bearing) + 1) % 4]
  end

  def turn_left
    @bearing = DIRECTIONS.keys[(DIRECTIONS.keys.index(@bearing) - 1) % 4]
  end
end

class Simulator
  COMMANDS = {
    'L' => :turn_left,
    'R' => :turn_right,
    'A' => :advance
  }.freeze

  def instructions(list_of_commands)
    @commands = list_of_commands.chars
    @array_of_commands = []
    @commands.each do |command|
      @array_of_commands << COMMANDS[command]
    end
    @array_of_commands
  end

  def place(robot, coordinates_and_bearing)
    robot.orient(coordinates_and_bearing[:direction])
    robot.at(coordinates_and_bearing[:x], coordinates_and_bearing[:y])
  end

  def evaluate(robot, commands)
    instructions(commands).each do |command|
      robot.send(command)
    end
  end
end

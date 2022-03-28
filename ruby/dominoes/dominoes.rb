# frozen_string_literal: true

class Dominoes
  def self.chain?(input)
    return true if input.empty?
    @input = input
    convert
    p @array_of_dominoes.show
    @array_of_dominoes.show.each_with_index do |domino, index|
      index.upto(@array_of_dominoes.show.size - 1) do |loop_index|
        if check_chain
          break
        elsif domino.right == @array_of_dominoes.show[loop_index].left
          if loop_index != (index + 1 % @array_of_dominoes.show.size - 1)
            @array_of_dominoes.show.insert(index + 1, @array_of_dominoes.show.delete_at(loop_index))
          end
          break
        elsif domino.right != @array_of_dominoes.show[loop_index].left
          @array_of_dominoes.show[loop_index].flip
          if domino_matches_next_domino(domino.right, @array_of_dominoes.show[loop_index].left)
            @array_of_dominoes.show.insert(index + 1, @array_of_dominoes.show.delete_at(loop_index))
            break
          else
            @array_of_dominoes.show[loop_index].flip
          end
        end
      end
    end
    matches
    p @array_of_dominoes.show
    check_chain ? true : solve
  end

  def self.domino_matches_next_domino(domino1, domino2)
    domino1 == domino2
  end

  def self.solve
    solutions = []
    0.upto(max_value_of_hash - 1) do |x|
      solution = [@array_of_dominoes.bricks[0]]
      until solution.size == @array_of_dominoes.bricks.size
        if @matches[solution.last].nil?
          break
        elsif @matches[solution.last].size > 1
          solution << if solution.include?(@matches[solution.last][x])
                        @matches[solution.last][x - 1]
                      else
                        @matches[solution.last][x]
                      end
        else
          solution << @matches[solution.last].flatten
        end
      end
      solutions << solution
    end
    solutions.any? { |x| (@array_of_dominoes.bricks - x).empty? }
  end

  def self.max_value_of_hash
    max = []
    @matches.each_value do |x|
      max << x.size
    end
    max.max
  end

  def self.convert
    @array_of_dominoes = DominoSequence.new(@input)
  end

  def self.matches
    @matches = {}
    @array_of_dominoes.bricks.each_with_index do |brick, index|
      matches = []
      0.upto(@array_of_dominoes.bricks.size - 1) do |loop_index|
        matches << @array_of_dominoes.bricks[loop_index] if brick[1] == @array_of_dominoes.bricks[loop_index][0] && @array_of_dominoes.bricks[index] != @array_of_dominoes.bricks[loop_index]
      end
      @matches[brick] = matches
    end
    @matches
  end

  def self.check_chain
    if @array_of_dominoes.size > 1
      @array_of_dominoes.check_if_the_cycle_is_complete && @array_of_dominoes.check_if_order_is_correct
    else
      @array_of_dominoes.check_if_the_cycle_is_complete
    end
  end
end

class DominoSequence < Array
  def initialize(dominoes)
    @array = []
    dominoes.each do |brick|
      @array << DominoBrick.new(brick)
    end
  end

  def show
    @array
  end

  def bricks
    @array.map(&:brick)
  end

  def check_if_the_cycle_is_complete
    @array.first.left == @array.last.right
  end

  def check_if_order_is_correct
    bricks.all? { |x, y| x[1] == y[0] }
  end

  def size
    @array.length
  end
end

class DominoBrick
  attr_reader :brick

  def initialize(brick)
    @brick = brick
  end

  def flip
    @brick = @brick.reverse
  end

  def left
    @brick[0]
  end

  def right
    @brick[1]
  end

end


dominoes = [[1, 2], [1, 3], [2, 3]]
Dominoes.chain?(dominoes)
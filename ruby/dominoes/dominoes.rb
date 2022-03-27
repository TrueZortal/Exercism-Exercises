# frozen_string_literal: true

class Dominoes
  def self.chain?(input)
    @input = input
    convert

    @array_of_dominoes.each_with_index do |domino, index|
      index.upto(@array_of_dominoes.size - 1) do |loop_index|
        if check_chain
          break
        elsif domino.right == @array_of_dominoes[loop_index].left
          if loop_index != (index + 1 % @array_of_dominoes.size - 1)
            @array_of_dominoes.insert(index + 1, @array_of_dominoes.delete_at(loop_index))
          end
          break
        elsif domino.right != @array_of_dominoes[loop_index].left
          @array_of_dominoes[loop_index].flip
          if domino.right == @array_of_dominoes[loop_index].left
            @array_of_dominoes.insert(index + 1, @array_of_dominoes.delete_at(loop_index))
            break
          else
            @array_of_dominoes[loop_index].flip
          end
        end
      end
    end
    matches
    check_chain ? true : solve
  end

  def self.solve
    solutions = []
    0.upto(max_value_of_hash - 1) do |x|
      solution = []
      solution << @bricks[0]
      until solution.size == @bricks.size
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
    solutions.any? { |x| (@bricks - x).empty? }
  end

  def self.max_value_of_hash
    max = []
    @matches.each_value do |x|
      max << x.size
    end
    max.max
  end

  def self.convert
    @array_of_dominoes = []
    @input.each do |brick|
      @array_of_dominoes << DominoBrick.new(brick)
    end
  end

  def self.matches
    @matches = {}
    @bricks.each_with_index do |brick, index|
      matches = []
      0.upto(@bricks.size - 1) do |loop_index|
        matches << @bricks[loop_index] if brick[1] == @bricks[loop_index][0] && @bricks[index] != @bricks[loop_index]
      end
      @matches[brick] = matches
    end
    @matches
  end

  def self.check_chain
    @bricks = @array_of_dominoes.map(&:brick)
    if @bricks.size > 1
      @bricks.flatten.first == @bricks.flatten.last && @bricks.all? { |x, y| x[1] == y[0] }
    else
      @bricks.flatten.first == @bricks.flatten.last
    end
  end
end

class DominoBrick
  attr_reader :left, :right, :brick

  def initialize(brick)
    @brick = brick
    @left = @brick[0]
    @right = @brick[1]
  end

  def flip
    @brick = @brick.reverse
    @left = @brick[0]
    @right = @brick[1]
  end
end

# frozen_string_literal: true

module Dominoes
  class << self
    def chain?(input)
      return true if input.empty?

      @input = input
      convert
      @array_of_dominoes.solve
      p @array_of_dominoes.solve
    end

    private

    def convert
      @array_of_dominoes = DominoSequence.new(@input)
    end
  end

  class DominoSequence
    def initialize(dominoes)
      @array = []
      dominoes.each do |brick|
        @array << DominoBrick.new(brick)
      end
    end

    def solve
      orient_all_bricks_correctly
      complete_with_just_flipping? ? true : solve_for_the_array_of_correctly_oriented_dominoes
    end

    private

    def orient_all_bricks_correctly
      show.each_with_index do |domino, index|
        index.upto(max_index) do |loop_index|
          break if complete_with_just_flipping?

          if domino.matches(show[loop_index])
            insert_as_next(index, loop_index) if loop_index != (index + 1 % size - 1)
            break
          else
            flip_check_if_matches_other_and_insert_as_next_if_not_unflip_so_less_mess_at_index(domino, index,
                                                                                               loop_index)
          end
        end
      end
    end

    def show
      @array
    end

    def bricks
      show.map(&:brick)
    end

    def size
      show.length
    end

    def max_index
      size - 1
    end

    def check_if_the_cycle_is_complete
      show.first.left == show.last.right
    end

    def check_if_order_is_correct
      bricks.all? { |x, y| x[1] == y[0] }
    end

    def domino_matches_next_domino(domino1, domino2)
      domino1 == domino2
    end

    def flip_check_if_matches_other_and_insert_as_next_if_not_unflip_so_less_mess_at_index(checked_domino, index_of_checked_domino, single_brick_index)
      show[single_brick_index].flip
      if domino_matches_next_domino(checked_domino.right, show[single_brick_index].left)
        insert_as_next(index_of_checked_domino, single_brick_index)
      else
        show[single_brick_index].flip
      end
    end

    def insert_as_next(original_brick_index, moved_brick_index)
      show.insert(original_brick_index + 1, show.delete_at(moved_brick_index))
    end

    def complete_with_just_flipping?
      if size > 1
        check_if_the_cycle_is_complete && check_if_order_is_correct
      else
        check_if_the_cycle_is_complete
      end
    end

    def generate_all_possible_matches_for_oriented_bricks
      output_matches = {}
      bricks.each_with_index do |brick, index|
        local_matches = []
        0.upto(size - 1) do |loop_index|
          if brick[1] == bricks[loop_index][0] && bricks[index] != bricks[loop_index]
            local_matches << bricks[loop_index]
          end
        end
        output_matches[brick] = local_matches
      end
      output_matches
    end

    def solve_for_the_array_of_correctly_oriented_dominoes
      solutions = []
      @matches = generate_all_possible_matches_for_oriented_bricks
      0.upto(max_index_of_hash) do |x|
        solution = [bricks[0]]
        until solution.size == size
          break if @matches[solution.last].nil?

          solution << if @matches[solution.last].size > 1
                        if solution.include?(@matches[solution.last][x])
                          @matches[solution.last][x - 1]
                        else
                          @matches[solution.last][x]
                        end
                      else
                        @matches[solution.last].flatten
                      end
        end
        solutions << solution
      end
      solutions.any? { |x| (bricks - x).empty? }
    end

    def max_index_of_hash
      max = []
      generate_all_possible_matches_for_oriented_bricks.each_value do |x|
        max << x.size
      end
      max.max - 1
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

    def matches(another_brick)
      right == another_brick.left
    end
  end
  private_constant :DominoBrick, :DominoSequence
end

# Dominoes::DominoBrick.new([1,2])
Dominoes::DominoSequence.new([])
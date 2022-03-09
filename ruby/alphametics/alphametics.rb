class Alphametics
 @@digits = *(0..9)

  def initialize(puzzle)
    @puzzle = puzzle
    @cleared_puzzle = @puzzle.split(/[\s]/).keep_if { |x| x.downcase != x  }
    @result = @cleared_puzzle.last
    @letters = @cleared_puzzle.join.chars.uniq
    @number_of_letters = @letters.size
    @letters_regexp = Regexp.union(@letters)
  end

  def solve
    find_combo
  end

  def self.solve(puzzle)
    Alphametics.new(puzzle).solve
  end

  def find_combo
    @possible_combinations = @@digits.permutation(@number_of_letters).to_a
    @possible_combinations.each_with_index do |combination, index|
      @solution = String.new
      hash = @letters.zip(@possible_combinations[index]).to_h
      combination.each_with_index do |x, index|
        @solution = @puzzle.gsub(@letters_regexp, hash)
      end
      if @solution.split(/\s/).map(&:to_i).join.length != @solution.split(/\s/).join.length-1
        next
      elsif eval(@solution)
        @correct_combination = @letters.zip(combination).to_h
        return @correct_combination
      else
        next
      end
    end

    if @correct_combination == nil
      {}
    else
      @correct_combination
    end
  end

end



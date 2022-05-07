class Game

  class BowlingError < StandardError
  end

  def initialize
    @array_of_turns = []
  end

  def roll(pins)
    raise BowlingError if pins < 0 || pins > 10 || no_extra_rolls
    # p @array_of_turns.size
    if @array_of_turns.empty?
      @array_of_turns << Turn.new(pins)
    elsif @array_of_turns.last.incomplete
      @array_of_turns.last.add_roll(pins)
    else
      @array_of_turns << Turn.new(pins)
    end
    # p @array_of_turns.empty? ? "empty" : "the game has had #{@array_of_turns.size} frames, score of the last frame was #{@array_of_turns.last.raw_score} and the current frame has been completed: #{!@array_of_turns.last.incomplete}"
  end

  def no_extra_rolls
    return false if @array_of_turns.size < 10

    if @array_of_turns[9].strike? || @array_of_turns[9].spare?
      if @array_of_turns.size == 11 && @array_of_turns[9].spare?
        @array_of_turns.last.rolls.size == 1
      elsif @array_of_turns.size == 11 && @array_of_turns[9].strike?
        @array_of_turns.last.rolls.size == 2 || @array_of_turns[10].strike? && @array_of_turns.size == 12
      end
    else
      @array_of_turns.size == 10 && !@array_of_turns.last.incomplete
    end
  end

  def game_hasnt_been_completed
    @array_of_turns.empty? ||
    @array_of_turns.size < 10 ||
    @array_of_turns[9].strike? && @array_of_turns.size < 12 && @array_of_turns[10].strike?
    # ||
    # @array_of_turns[9].strike? && @array_of_turns.size == 11 &&
  end

  def game_has_been_completed
    @array_of_turns.size == 10 &&  (@array_of_turns[9].strike? || @array_of_turns[9].spare?)
  end

  def score
    raise BowlingError if  game_has_been_completed || game_hasnt_been_completed
    # p @array_of_turns[9].strike? && (@array_of_turns.size < 11 && @array_of_turns.last.rolls.size != 2 || @array_of_turns.size < 12 && @array_of_turns.last.strike?)

    # p @array_of_turns
    @end_results = []
    @array_of_turns.each_with_index do |turn, index|
      if index == 0
        @end_results << turn.raw_score
      elsif index > 9
        @end_results << turn.raw_score
      elsif @array_of_turns[index-1].spare?
        if turn.strike?
          @end_results << turn.raw_score * 2
        else
          @end_results << (turn.rolls[0] * 2 + turn.rolls[1])
        end
      elsif @array_of_turns[index-1].strike?
        if @array_of_turns[index-2].strike?
          if turn.strike?
            @end_results << (turn.raw_score * 3)
          else
            @end_results << (turn.rolls[0] * 3 + turn.rolls[1] * 2)
          end
        else
          @end_results << (turn.raw_score * 2)
        end
      else
        @end_results << turn.raw_score
      end
    end
    # p @array_of_turns.map { |x| x.spare?}
    # p @array_of_turns.map { |x| x.strike?}
    p @end_results
    # p @array_of_turns.size
    @end_results.reduce(&:+)
  end

  class Turn

    attr_accessor :rolls
    def initialize(pins_struck)
      @rolls = []
      add_roll(pins_struck)
    end

    def incomplete
      @rolls.size != 2 && raw_score != 10
    end

    def add_roll(pins_struck)
      @rolls << pins_struck

      raise BowlingError if raw_score > 10
    end

    def raw_score
      @rolls.reduce(&:+)
    end

    def strike?
      raw_score == 10 && @rolls.size == 1
    end

    def spare?
      raw_score == 10 && @rolls.size == 2
    end
  end
end

# game = Game.new
#     rolls = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10]
#     rolls.each { |pins| game.roll(pins) }
#     p game.score

    # @array_of_turns[9].strike? && (@array_of_turns.size < 11 && @array_of_turns.last.rolls.size != 2 || @array_of_turns.size < 12 && @array_of_turns.last.strike?)
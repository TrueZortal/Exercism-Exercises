# frozen_string_literal: true

class Game
  class BowlingError < StandardError
  end

  def initialize
    @array_of_turns = []
  end

  def roll(pins)
    raise BowlingError if pins.negative? || pins > 10 || no_extra_rolls

    add_roll_or_create_new_turn(pins)
  end

  def score
    raise BowlingError if game_hasnt_been_completed

    calculate_the_score
  end

  private

  def add_roll_or_create_new_turn(pins)
    if @array_of_turns.empty?
      @array_of_turns << Turn.new(pins)
    elsif @array_of_turns.last.incomplete
      @array_of_turns.last.add_roll(pins)
    else
      @array_of_turns << Turn.new(pins)
    end
  end

  def no_extra_rolls
    return false if @array_of_turns.size < 10

    if last_standard_turn_is_a_strike_or_spare
      block_additonal_rolls_for_strikes_and_spares
    else
      block_additional_rolls_for_a_completed_frame
    end
  end

  def block_additonal_rolls_for_strikes_and_spares
    if @array_of_turns.size == 11 && @array_of_turns[9].spare?
      @array_of_turns.last.rolls.size == 1
    elsif @array_of_turns.size >= 11 && @array_of_turns[9].strike?
      complete_game_after_a_strike_in_standard_final_round
    end
  end

  def complete_game_after_a_strike_in_standard_final_round
    @array_of_turns.last.rolls.size == 2 || @array_of_turns[10].strike? && @array_of_turns.size == 12
  end

  def block_additional_rolls_for_a_completed_frame
    @array_of_turns.size == 10 && !@array_of_turns.last.incomplete
  end

  def last_standard_turn_is_a_strike_or_spare
    @array_of_turns[9].strike? || @array_of_turns[9].spare?
  end

  def game_hasnt_been_completed
    (@array_of_turns.size == 10 && last_standard_turn_is_a_strike_or_spare) ||
      @array_of_turns.empty? ||
      @array_of_turns.size < 10 ||
      @array_of_turns[9].strike? && @array_of_turns.size < 12 && @array_of_turns[10].strike?
  end

  def calculate_the_score
    @end_results = []
    @array_of_turns.each_with_index do |turn, index|
      @end_results << if index.zero? || index > 9
                        turn.raw_score
                      elsif last_turn_was_spare?(index)
                        scoring_logic_for_spares(turn)
                      elsif last_turn_was_strike?(index)
                        scoring_logic_for_strikes(turn, index)
                      else
                        turn.raw_score
                      end
    end
    @end_results.reduce(&:+)
  end

  def last_turn_was_strike?(index)
    @array_of_turns[index - 1].strike?
  end

  def last_turn_was_spare?(index)
    @array_of_turns[index - 1].spare?
  end

  def scoring_logic_for_strikes(turn, index)
    if @array_of_turns[index - 2].strike?
      if turn.strike?
        (turn.raw_score * 3)
      else
        (turn.rolls[0] * 3 + turn.rolls[1] * 2)
      end
    else
      (turn.raw_score * 2)
    end
  end

  def scoring_logic_for_spares(turn)
    if turn.strike?
      turn.raw_score * 2
    else
      (turn.rolls[0] * 2 + turn.rolls[1])
    end
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

  private_constant :Turn
end

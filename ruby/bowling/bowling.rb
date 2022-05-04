class Game
  def initialize
    @array_of_turns = []
  end

  def roll(pins)
    if @array_of_turns.empty?
      @array_of_turns << Turn.new(pins)
    elsif @array_of_turns.last.incomplete
      @array_of_turns.last.add_roll(pins)
    else
      @array_of_turns << Turn.new(pins)
    end
  end

  def score
    p @array_of_turns
    @array_of_turns.map {|turn| turn.score}.reduce(&:+)
  end

  class Turn
    attr_accessor :rolls, :multiplier_self, :multiplier_next
    def initialize(score)
      @rolls = []
      add_roll(score)
      #multiplier of 0 for 0 rolls
      @multiplier_self = [[1, 0]]
      @multiplier_next = [[1, 0]]

    end

    def incomplete
      @rolls.size != 2 || @rolls.reduce(&:+) != 10
    end

    def add_roll(score)
      @rolls << score
      @raw_score = @rolls.reduce(&:+)
      if @raw_score == 10 && @rolls.size == 1
        @multiplier_next[0][0] += 1
        @multiplier_next[0][1] += 2
      elsif @raw_score == 10 && @rolls.size == 2
        @multiplier_next[0][0] += 1
        @multiplier_next[0][1] += 1
      end
    end

    def score
      @score = 0
      if @multiplier_self[0] == 0
        @score = @rolls.reduce(&:+)
      else
        @rolls.each do |roll|
          if @multiplier_self[0][1] != 0
            @score += roll * @multiplier_self[0][0]
            @multiplier_self[0][1] -= 1
          else
            @score += roll
          end
        end
      end
      @score
    end
  end
end

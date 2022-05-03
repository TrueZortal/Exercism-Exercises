class Game
  def initialize
    @score = []
  end

  def roll(pin)
    @score << pin.to_i
  end

  def score
    strike_storage = []
    @score.each_with_index do |roll, index|
      strike_storage << [@score.delete_at(index), index] if roll == 10
    end

    rolls = @score.each_slice(2).to_a
    strike_storage.each do |strike|
      rolls.insert(strike[1],[strike[0]])
    end

    # p rolls
    scores = []
    rolls.each_with_index do |roll, index|
        if rolls[index-1].sum == 10 &&  rolls[index-1].size == 1 && rolls[index-2].sum == 10 &&  rolls[index-2].size == 1
          p 'this'
          scores << roll.reduce(&:+) * 3
        elsif rolls[index-1].sum == 10 &&  rolls[index-1].size == 1
          p 'this'
          scores << roll.reduce(&:+) * 2
        elsif rolls[index-1].sum == 10 && index > 9
          scores << roll.reduce(&:+)
        elsif rolls[index-1].sum == 10
          scores << [roll[0] * 2, roll[1]].reduce(&:+)
        else
          scores << roll.reduce(&:+)
        end
      end
      # p scores
    scores.reduce(&:+)
  end
end

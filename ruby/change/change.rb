class Change
  class ImpossibleCombinationError < StandardError; end
  class NegativeTargetError < StandardError; end

  def self.generate(coins, amount)
    raise NegativeTargetError if amount.negative?
    return [] if amount.zero?

    (1..(amount/coins.min).floor).each do |elem|
      combination = coins.repeated_combination(elem).find { |combo| combo.sum == amount }

      return combination if combination
    end

    raise ImpossibleCombinationError
  end

end

class Change
  def self.generate(coins, amount)
    # return [amount] if amount in coins
    @amount = amount
    solution = []

    until @amount.zero?
      grabbed_modulo_coin = coins.select { |elem| (amount % elem).zero? }.select { |elem| elem <= @amount }.max
      grabbed_max_coin = coins.select { |elem| elem <= @amount }.max

      # if grabbed_modulo_coin == grabbed_max_coin
        solution.unshift(grabbed_max_coin)
        @amount -= grabbed_max_coin
      # else
        # solution.unshift(grabbed_modulo_coin)
        # @amount -= grabbed_modulo_coin
      # end
      # p "#{solution} remaining #{@amount}"
      # p grabbed_coin
    end

    solution
  end
end

#find smallest combination of elements of an array up to an amount
#check if it can be done in 1 coin

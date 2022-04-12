class Change
  def self.generate(coins, amount)
    @coins = coins.reverse
    @amount = amount
    @change = []
    @possible_change = []
    until @amount == 0
      check_for_coins_that_fit
      @possible_change.each_with_index do |coin, index|
      if @amount - coin >= 0
        @amount -= coin
        @change.unshift(coin)
        break
      end
    end

    end
    @change
  end

    def self.check_for_largest_mod_0_of_any_remaining_coin(change)
      @possible_change.select {|coin| change % coin == 0}.max
    end

    def self.check_for_coins_that_fit
      @coins.each do |coin|
        if @amount - coin >= 0
          @possible_change << coin
        end
      end
    end
end

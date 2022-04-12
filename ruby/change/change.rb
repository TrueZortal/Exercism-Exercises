class Change
  def self.generate(coins, amount)
    @coins = coins.reverse
    @amount = amount
    @change = []
    until @amount == 0
      @possible_change = []
      check_for_coins_that_fit
      if @amount

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

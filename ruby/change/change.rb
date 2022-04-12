class Change
  def self.generate(coins, amount)
    @coins = coins.reverse
    @amount = amount
    @change = []
    until @amount == 0
      @possible_change = []
      check_for_coins_that_fit
      @possible_change do |coin|
        @amount % coin == 0
      end
    end
    @change
  end
    def self.check_if_mod_0_of_any_remaining_coin(change)
      @coins.select {|coin| change % coin == 0}
    end

    def self.check_for_coins_that_fit
      @coins.each do |coin|
        if @amount - coin >= 0
          @possible_change << coin
        end
      end
    end
end

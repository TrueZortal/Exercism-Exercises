class Poker
attr_reader :hands

def initialize(hands)
  initial_hands = [hands]
  @hands = []
  initial_hands.each do |hand|
    @hands << Hand.new(hand)
  end
end

    # class Hand, takes a set of 5 cards, attributes: card_list, how_good?, max_valid_card
  class Hand
    attr_reader :cards_in_hand, :max_valid_card

    @@dictionary = {'J' => '11', 'Q' => '12','K' => '13','A' => '14'}

    def initialize(cards_in_hand)
      cards_in_hand
      @cards_in_hand = cards_in_hand
      @max_valid_card = nil
      @figures_in_hand = figures(@cards_in_hand)
      sequential?(@figures_in_hand)
    end

    def figures(hand)
      hand
      figures = hand.map {|card| card[0...-1]}
      convert_to_numbers(figures)
    end

    def convert_to_numbers(hand)
      hand.map! do |x|
        if @@dictionary.include?(x)
          x = @@dictionary[x]
        else
          x
        end
      end
    end

    def sequential?(hand)
      test = []
      if hand.any?('14')
        hand = hand.map(&:to_i).sort
        hand.pop
        hand.unshift(1)
        hand.each_with_index do |x, index|
          if (index + 2) > hand.size
            test << true
          else
            test << ((x + 1) == hand[index + 1])
          end
        end
      else
        hand.map(&:to_i).sort.each_with_index do |x, index|
          if (index + 2) > hand.size
            test << true
          else
            test << ((x + 1) == hand[index + 1])
          end
        end
      end
      if test.all?(true)
        @max_valid_card = hand.max
        true
      else
        false
      end
    end

    def same_suit?(hand)
    end

    def find_multiples?(hand)
   end
  end
end

# Straight flush = sequential 5 in same colour x 8
# Four of a kind x 7
# Full House 2+3 figures 6
# Flush 5 of same suit x 5
# Straight 5 sequential x 4
# Three of a kind x 3
# Two pair 2+2 x 2
# One pair 2 x 1
# High card 0

# is sequential?
# is same suit?
# find_multiples?

# test = Poker.new(%w[4S 5S 7H 8D JC])
test = Poker.new(%w[2S 4S 3H AC 5D])
p test.hands

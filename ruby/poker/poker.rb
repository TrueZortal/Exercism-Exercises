# frozen_string_literal: true

class Poker
  attr_reader :hands

  def initialize(hands)
    initial_hands = hands
    @hands = []
    initial_hands.each do |hand|
      @hands << Hand.new(hand)
    end
  end

  def best_hand
    return [@hands[0].cards_in_hand] if @hands.size == 1

    # p @hands
    array_of_best_hands = []
    @hands.sort_by! { |hand| [-hand.how_good, -hand.max_valid_card] }

    @hands.each do |hand|
      if array_of_best_hands.empty? || hand.how_good == array_of_best_hands[0].how_good && hand.max_valid_card == array_of_best_hands[0].max_valid_card && hand.secondary_deciding_figure == array_of_best_hands[0].secondary_deciding_figure
        array_of_best_hands << hand
      else
        break
      end
    end
    array_of_best_hands.map(&:cards_in_hand)
  end

  # class Hand, takes a set of 5 cards, attributes: card_list, how_good, max_valid_card
  class Hand
    attr_reader :cards_in_hand, :max_valid_card, :how_good, :secondary_deciding_figure

    @@dictionary = { 'J' => '11', 'Q' => '12', 'K' => '13', 'A' => '14' }

    def initialize(cards_in_hand)
      @cards_in_hand = cards_in_hand
      @max_valid_card = nil
      @how_good = nil
      @secondary_deciding_figure = nil
      # @figures_in_hand = figures(@cards_in_hand)
      # p cards_in_hand
      # # p @figures_in_hand
      # p sequential?(@cards_in_hand)
      # p sequential?(@figures_in_hand)
      # same_suit?(@cards_in_hand)
      # find_type_of_multiple_or_lack_thereof_hand_goodness_and_max_card(@figures_in_hand)
      assign_hand_value(@cards_in_hand)
    end

    def figures(hand)
      convert_to_numbers(hand.map { |card| card[0...-1] })
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

    def assign_hand_value(hand)
      if sequential?(hand) && same_suit?(hand)
        @how_good = 8
        sequential?(hand)
      elsif same_suit?(hand)
        @how_good = 5
        @max_valid_card = figures(hand).map(&:to_i).max
      elsif sequential?(hand)
        @how_good = 4
        sequential?(hand)
      else
        find_type_of_multiple_or_lack_thereof_hand_goodness_and_max_card(figures(hand))
      end
    end

    #returns bool
    def sequential?(figures_in_hand)
      temp_hand = figures(figures_in_hand)
      @test = []
      if temp_hand.any?('14') && temp_hand.include?('2')
        temp_hand = temp_hand.map(&:to_i).sort #what the fuck? map! doesnt work assignment to a map does -.-
        temp_hand.pop
        temp_hand.unshift(1)
      end
      check_sequence_output_sorted_array_of_converted_figures(temp_hand, @test)
      return false unless @test.all?(true)

      @max_valid_card = temp_hand.map(&:to_i).max
      true
    end

    def check_sequence_output_sorted_array_of_converted_figures(tested_array, returned_array)
      temp_tested_array = tested_array.map(&:to_i).sort
      temp_tested_array.each_with_index do |x, index|
        returned_array << if (index + 2) > temp_tested_array.size
                            true
                          else
                            ((x + 1) == temp_tested_array[index + 1].to_i)
                          end
      end
      temp_tested_array
    end

    #returns bool
    def same_suit?(hand)
      hand.map { |card| card[-1...card.length] }.uniq.length == 1
    end

    # takes figures in hand, returns number of cards with multiples and values as hash {card => #ofcard, card2 => #ofcard2}
    def find_multiples?(figures_in_hand)
      unique_cards = figures_in_hand.uniq
      multiples = Hash.new
      unique_cards.each do |unique_card|
        multiples[unique_card] = figures_in_hand.count(unique_card)
      end
      multiples.reject { |_, count| count == 1 }
    end

    def find_type_of_multiple_or_lack_thereof_hand_goodness_and_max_card(figures_in_hand)
      pairs_or_lack_thereof = find_multiples?(figures_in_hand)

      if pairs_or_lack_thereof.empty?
        @max_valid_card = figures_in_hand.map(&:to_i).max
        @secondary_deciding_figure = figures_in_hand.map(&:to_i).min
        @how_good = 0
      elsif pairs_or_lack_thereof.size == 1
        if pairs_or_lack_thereof.values.max == 2
          @how_good = 1
          @max_valid_card = pairs_or_lack_thereof.keys.map(&:to_i).max
        elsif pairs_or_lack_thereof.values.max == 3
          @how_good = 3
          @max_valid_card = pairs_or_lack_thereof.keys.map(&:to_i).max
        else
          @how_good = 7
          @max_valid_card = pairs_or_lack_thereof.keys.map(&:to_i).max
        end
      else
        if pairs_or_lack_thereof.size == 2
          if pairs_or_lack_thereof.values.max == 2
            @how_good = 2
            @max_valid_card = pairs_or_lack_thereof.keys.map(&:to_i).max
            @secondary_deciding_figure = pairs_or_lack_thereof.keys.map(&:to_i).min
          else
            @how_good = 5
            @max_valid_card = pairs_or_lack_thereof.key(3).to_i
            @secondary_deciding_figure = pairs_or_lack_thereof.key(2).to_i
          end
        end
      end
    end
  end
end

# Straight flush = sequential 5 in same colour x 8 sequential + suit
# Four of a kind x 7 multiples
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
# # test = Poker.new(%w[2S 4S 3H AC 5D])
# # test = Poker.new(%w[10S JS QH AC KD])
# test = Poker.new([%w[5H 5S 5D 8S 8D]])
# p test.hands

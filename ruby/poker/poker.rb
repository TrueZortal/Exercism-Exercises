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

    check_for_best_hands(@hands)
  end

  private

  def check_for_best_hands(array_of_hands)
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

  class Hand
    attr_reader :cards_in_hand, :max_valid_card, :how_good, :secondary_deciding_figure

    @@dictionary = { 'J' => '11', 'Q' => '12', 'K' => '13', 'A' => '14' }

    def initialize(cards_in_hand)
      @cards_in_hand = cards_in_hand
      @max_valid_card = nil
      @how_good = nil
      @secondary_deciding_figure = nil
      assign_hand_value(@cards_in_hand)
    end

    private

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


    def sequential?(figures_in_hand)
      temp_hand = figures(figures_in_hand)
      @test = []
      if temp_hand.any?('14') && temp_hand.include?('2')
        temp_hand = temp_hand.map(&:to_i).sort
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

    def same_suit?(hand)
      hand.map { |card| card[-1...card.length] }.uniq.length == 1
    end

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





















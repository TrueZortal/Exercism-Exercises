class Poker
  @@dictionary = {'J' => '11', 'Q' => '12','K' => '13','A' => '14'}

  def initialize(hands)
    @hands = hands
  end

  #return_format [weight_of_hand, Highest_deciding_figure, secondary_deciding_figure (base nil)]

  def best_hand
    hands_with_evals = pair_hands_with_evaluations
    # p hands_with_evals
    sorted_by_weight = hands_with_evals.sort_by {|hand, eval| -eval[0]}.to_h
    test = sorted_by_weight.values[0][0]
    # p sorted_by_weight.values
    # p sorted_by_weight.values.all? {|value| p value[0] }
    if sorted_by_weight.values.all? {|value| value[0] == test }
      sorted_by_weight_and_highest_card = sorted_by_weight.sort_by {|hand, eval| -eval[1]}
      [sorted_by_weight_and_highest_card[0][0]]
    else
      [sorted_by_weight.to_a[0][0]]
    end
  end

  private

  def strip_suits(hand)
    figures = hand.map {|card| card = card[0...-1]}
    figures.map! {|figure| transform_into_nums(figure)}
  end

  def pair_hands_with_evaluations
    hands_with_evals = Hash.new
    @hands.each do |hand|
      hands_with_evals[hand] = evaluate_hand(hand)
    end
    p hands_with_evals
    hands_with_evals
  end

  def evaluate_hand(hand)
    if sequential?(hand) && same_suit?(hand)
      return [8, strip_suits(hand).max, nil]
    elsif sequential?(hand)
      return [4, strip_suits(hand).max, nil]
    elsif same_suit?(hand)
      return [5, strip_suits(hand).max, nil]
    else
      multiples(hand)
    end
  end

  def transform_into_nums(card)
    if @@dictionary.keys.include?(card)
      @@dictionary[card].to_i
    else
      card.to_i
    end
  end

  def find_multiples?(hand)
    card_values = strip_suits(hand)
    unique_card_values = card_values.uniq.sort
    count_of_occurences = Hash.new
    unique_card_values.each do |unique_card|
      count_of_occurences[unique_card] = card_values.count(unique_card)
    end
    count_of_occurences.reject! {|occurence, v| v == 1}
  end

  def same_suit?(hand)
    base = hand[0][-1]
    hand.all? {|card| card[-1] == base}
  end

  def sequential?(hand)
    card_values = strip_suits(hand)
    # p card_values.max
    card_values.max == 14 ? card_values.sort[3] == card_values.size && find_multiples?(hand).empty? : card_values.max - card_values.min + 1 == card_values.size && find_multiples?(hand).empty?
  end

  def multiples(hand)
    return [0, strip_suits(hand).max, nil] if find_multiples?(hand).empty?

    pairs = find_multiples?(hand)
    if pairs.size == 1
      if pairs.values.max == 2
        return [1, pairs.keys, nil].flatten
      elsif pairs.values.max == 3
        return [3, pairs.keys, nil].flatten
      elsif pairs.values.max == 4
        return [7, pairs.keys, nil].flatten
      end
    elsif pairs.size == 2
      if pairs.values.max == 2
        return [2, pairs.keys.sort.reverse].flatten
      else
        return [6, pairs.keys.sort.reverse].flatten
      end
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


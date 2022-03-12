# frozen_string_literal: true

class Allergies
  attr_reader :list

  @@allergens = {
    1 => 'eggs',
    2 => 'peanuts',
    4 => 'shellfish',
    8 => 'strawberries',
    16 => 'tomatoes',
    32 => 'chocolate',
    64 => 'pollen',
    128 => 'cats'
  }
  def initialize(allergy_score)
    @allergy_score = allergy_score % 256
    list_of_allergies
    @list = @list_of_allergies
  end

  def allergic_to?(allergen)
    @list_of_allergies.include?(allergen)
  end

  def list_of_allergies
    @list_of_allergies = []
    @@allergens.keys.reverse.each do |x|
      if x <= @allergy_score
        @list_of_allergies << @@allergens[x]
        @allergy_score -= x
      end
    end
  end
end

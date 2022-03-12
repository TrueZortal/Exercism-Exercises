class Allergies
 @@allergens = {
   1 =>'eggs',
   2 => 'peanuts',
   4 => 'shellfish',
   8 => 'strawberries', 
   16 => 'tomatoes',
   32 => 'chocolate',
   64 => 'pollen',
   128 => 'cats'
 }
  def initialize(allergy_score)
    @allergy_score = allergy_score
    p @allergy_score
    list_of_allergies
  end

  def allergic_to?(allergen)
    @list_of_allergies.include?(allergen)
  end

  def list_of_allergies
    @list_of_allergies = []
    if @allergy_score == 0
      while @allergy_score > 0
        p @allegry_score
        @list_of_allergies << @@allergens[@allegry_score]
        @allergy_score / 2 
      end
    end
    @list_of_allergies
    p @list_of_allergies
  end

end

# eggs (1)
# * peanuts (2)
# * shellfish (4)
# * strawberries (8)
# * tomatoes (16)
# * chocolate (32)
# * pollen (64)
# * cats (128)
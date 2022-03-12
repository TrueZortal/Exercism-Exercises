class Allergies
 @@Allergens = {
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
    
  end

  def allergic_to(allergen)
  end

  def list_of_allergies
    if @allergy_score
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
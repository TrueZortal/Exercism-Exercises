# frozen_string_literal: true

class Complement
  @complements_of_RNA_thingies = { 'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U' }
  def self.of_dna(given_value)
    complement = String.new
    given_value.chars.map { |x| complement += @complements_of_RNA_thingies[x] }
    complement
  end
end

# frozen_string_literal: true

class Complement
  @complements_of_RNA_thingies = { 'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U' }
  def self.of_dna(given_value)
    given_value.chars.reduce(String.new) { |complement, x| complement += @complements_of_RNA_thingies[x] }
  end
end

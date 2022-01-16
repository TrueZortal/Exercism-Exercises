# frozen_string_literal: true

class Complement
  def self.of_dna(given_value)
    @rna = given_value.chars
    complement = String.new
    @rna.each do |var|
      case var
      when 'G'
        complement += 'C'
      when 'C'
        complement += 'G'
      when 'T'
        complement += 'A'
      when 'A'
        complement += 'U'
      end
    end
    complement
  end
end

class Complement
  def self.of_dna(given_value)
    @rna = given_value.chars
    complement = String.new
    for var in @rna
      if var == 'G'
        complement = complement + 'C'
      elsif var == 'C'
        complement = complement + 'G'
      elsif var == 'T'
        complement = complement + 'A'
      elsif var == 'A'
        complement = complement + 'U'
      end
    end
    complement
  end
end


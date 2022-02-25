class InvalidCodonError < StandardError
end

class Translation
  @dictionary = [
    {name: 'Methionine',codon: 'AUG'},
    {name: 'Phenylalanine', codon: 'UUU UUC'},
    {name: 'Leucine', codon: 'UUA UUG'},
    {name: 'Serine', codon: 'UCU UCC UCA UCG'},
    {name: 'Tyrosine', codon: 'UAU UAC'},
    {name: 'Cysteine', codon: 'UGU UGC'},
    {name: 'Tryptophan', codon: 'UGG'},
    {name: 'STOP', codon: 'UAA UAG UGA'}
  ]
  def self.of_codon(codon)
    codon
    @dictionary.select {|x| x[:codon].include?(codon)}[0][:name]
  end

  def self.of_rna(strand)
    array_of_codons = []
    array_of_codons << strand.slice!(0..2) until strand.empty?
    translation = []
    array_of_codons.each do |check|
      begin
      if @dictionary.select {|x| x[:codon].include?(check)}[0][:name] != 'STOP'
       translation << @dictionary.select {|x| x[:codon].include?(check)}[0][:name]
      else
        break
      end
      rescue
        raise InvalidCodonError
      end
    end
    translation
  end
end

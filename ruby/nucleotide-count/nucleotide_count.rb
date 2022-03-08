class Nucleotide

  VALID_NUCLEOTIDES = ['A', 'T', 'G', 'C']

  def initialize (dna_slice)
    raise ArgumentError unless dna_slice.chars.all? {|x| VALID_NUCLEOTIDES.include?(x)} || dna_slice == ''

    @dna_slice = dna_slice
  end

  def self.from_dna(dna_slice)
    new(dna_slice)
  end

  def count(which)
    @dna_slice.count which
  end

  def histogram
    histogram_of_nucleotides = {}
    VALID_NUCLEOTIDES.each do |nucleotide|
      histogram_of_nucleotides[nucleotide] = 0
      if @dna_slice != ''
      histogram_of_nucleotides[nucleotide] = count(nucleotide)
      end
    end
    histogram_of_nucleotides
  end
end

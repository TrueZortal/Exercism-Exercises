class Dominoes
  def self.chain?(input)
    @input = input
    # return false unless input.flatten.uniq.size == (@input.flatten.size / 2)
    # p @input.map! { |x| x.sort}
    correct_pairs = 0
    @input.each_with_index do |domino, index|

  end
end

dominoes = [[1, 2], [3, 1], [2, 3]]
Dominoes.chain?(dominoes)

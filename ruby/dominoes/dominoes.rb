class Dominoes
  def self.chain?(input)
    chain_size = input.size
    # p chain_size
    @input = input + input.map(&:reverse)
    # p @input
    results = []
    verification = []
    number = 0
    @input.combination(chain_size).to_a.reject! {|x| x.flatten.first != x.flatten.last}.each do |chain| #
      p chain
      number += 1
      chain.each_with_index do |elem, index|
       if elem == chain.last
          verification << elem
          if verification != chain
            verification = []
            next
          else
            results << chain
            verification = []
          end
        elsif elem[1] == chain[index+1][0]
          verification << elem
        end
      end
    end
    p results
    p number
    results == @input ? true : !results.empty?

    # correct_pairs = 0
    # @input.each_with_index do |domino, index|

  end
end

dominoes = [[1, 2], [2, 3], [3, 1], [2, 4], [2, 4]]
Dominoes.chain?(dominoes)

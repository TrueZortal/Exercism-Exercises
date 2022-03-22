class Dominoes
  def self.chain?(input)
    @input = input
    convert
    p bricks
    # p @array_of_dominoes
    # p @bricks
    num = 0
    @array_of_dominoes.each_with_index do |domino,index|
      index.upto(@array_of_dominoes.size-1) do |loop_index|
        # p loop_index
        # p @array_of_dominoes[loop_index]
        if domino.right == @array_of_dominoes[loop_index].left
          # p "#{domino.right} is equal to #{@array_of_dominoes[loop_index].left}"
          break
        elsif domino.right != @array_of_dominoes[loop_index].left
          @array_of_dominoes[loop_index].flip
          if domino.right == @array_of_dominoes[loop_index].left
            # p "#{domino.right} is equal to #{@array_of_dominoes[loop_index].left}"
            break
          else
            @array_of_dominoes[loop_index].flip
          end
        end
      end
    end
    p bricks
  end

  def self.convert
    @array_of_dominoes = []
    @input.each do |brick|
      @array_of_dominoes << DominoBrick.new(brick)
    end
  end

  def self.bricks
    @bricks = @array_of_dominoes.map {|x| x.brick}
  end

end

class DominoBrick
  attr_reader :left, :right, :brick

  def initialize(brick)
    @brick = brick
    @left = @brick[0]
    @right = @brick[1]
  end

  def flip
    @brick = @brick.reverse
    @left = @brick[0]
    @right = @brick[1]
  end

end



# Dominoes.chain?([1,1])


# class Dominoes
#   def self.chain?(input)
#     chain_size = input.size
#     # p chain_size
#     @input = input + input.map(&:reverse)
#     # p @input
#     results = []
#     verification = []
#     number = 0
#     @input.combination(chain_size).to_a.reject! {|x| x.flatten.first != x.flatten.last}.each do |chain| #
#       p chain
#       number += 1
#       chain.each_with_index do |elem, index|
#        if elem == chain.last
#           verification << elem
#           if verification != chain
#             verification = []
#             next
#           else
#             results << chain
#             verification = []
#           end
#         elsif elem[1] == chain[index+1][0]
#           verification << elem
#         end
#       end
#     end
#     p results
#     p number
#     results == @input ? true : !results.empty?

#     # correct_pairs = 0
#     # @input.each_with_index do |domino, index|

#   end
# end

dominoes = [[1, 2], [2, 3], [1, 3], [2, 4], [2, 4]]
Dominoes.chain?(dominoes)

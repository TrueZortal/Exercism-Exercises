class Dominoes
  def self.chain?(input)
    @input = input
    convert
    # p @array_of_dominoes
    # p @bricks
    # p check_chain

    @array_of_dominoes.each_with_index do |domino,index|
      index.upto(@array_of_dominoes.size-1) do |loop_index|
        # p loop_index
        # p @array_of_dominoes[loop_index]
        if check_chain
          break
        elsif domino.right == @array_of_dominoes[loop_index].left
          if loop_index != (index+1 % @array_of_dominoes.size-1)
            # p loop_index
            # p index+1
            # p "somehow this 1"
            @array_of_dominoes.insert(index+1,@array_of_dominoes.delete_at(loop_index))
          end
          break
        elsif domino.right != @array_of_dominoes[loop_index].left
          @array_of_dominoes[loop_index].flip
          if domino.right == @array_of_dominoes[loop_index].left
            # p "somehow this"
            @array_of_dominoes.insert(index+1,@array_of_dominoes.delete_at(loop_index))
            break
          else
            @array_of_dominoes[loop_index].flip
          end
        end
      end
    end
    check_chain
    # matches
    # p @matches
    # p @bricks
  end


  def self.convert
    @array_of_dominoes = []
    @input.each do |brick|
      @array_of_dominoes << DominoBrick.new(brick)
    end
  end

  def self.matches
    @matches = {}
    @bricks.each_with_index do |brick, index|
      matches = []
      0.upto(@bricks.size-1) do |loop_index|
        if brick[1] == @bricks[loop_index][0] && @bricks[index] != @bricks[loop_index]
          matches << @bricks[loop_index]
        end
      end
      @matches[brick] = matches
    end
    @matches
  end

  def self.check_chain
    # p @array_of_dominoes
    @bricks = @array_of_dominoes.map {|x| x.brick}
    if @bricks.size > 1
      @bricks.flatten.first == @bricks.flatten.last && @bricks.all? {|x,y| x[1] == y[0]}
    else
      @bricks.flatten.first == @bricks.flatten.last
    end
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

# dominoes = [[1, 2], [2, 3], [3, 1], [1, 1], [2, 2], [3, 3]]
dominoes = [[1, 2], [2, 3], [3, 1], [2, 4], [2, 4]]
# dominoes = [[1, 2], [5, 3], [3, 1], [1, 2], [2, 4], [1, 6], [2, 3], [3, 4], [5, 6]]
Dominoes.chain?(dominoes)

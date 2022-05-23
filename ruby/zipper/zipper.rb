class Zipper
  attr_reader :zipped
  def self.from_tree(tree)
    @zipped = []
  end

  def self.list(tree)
    # PRE-ORDER
    # p tree.value
    # if tree.left != nil
    #   list(tree.left)
    # end

    # if tree.right != nil
    #   list(tree.right)
    # end

    # PRE-ORDER 2
    # if !tree.nil?
    #   p tree.value
    #   list(tree.left)
    #   list(tree.right)
    # end

    # POST-ORDER
    # if tree.left != nil
    #   list(tree.left)
    # end
    # if tree.right != nil
    #   list(tree.right)
    # end
    # p tree

  end

  def self.zippidyzipzip(tree)
    @zipped << [tree]
    if tree.left != nil
      zippidyzipzip(tree.left)
    end
  end

    # if tree.left != nil
    #   list(tree.left)
    # end

    # if tree.right != nil
    #   list(tree.right)
    # end
  # end

  def self.to_tree
  end
end

class Node
  attr_accessor :value, :left, :right, :parent
  def initialize(value = nil, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
    @parent = nil
  end


end

# Node.new(1,

# (1,(2,nil,(3,nil,nil)),(4,nil,nil))
# value ,L/R, Parent, Sibling

# (nil,1,nil,nil,(L,2,1,(4,nil,nil)(R,3,2,nil)),(R,4,1,(2,nil,3)))

# L/R
# value = value
# Parent
# Sibling of left = right
# Sibling of right = left




tree =
      Node.new(1,
        Node.new(2,
          nil,
          Node.new(3,
            nil,
            nil)),
        Node.new(4,
          nil,
          nil))

Zipper.zippidyzipzip(tree)
Zipper.zipped

# p tree.to_s

# random_thing = [nil,1,nil,nil,['L',2,1,[4,nil,nil],['R',3,2,nil]],['R',4,1,[2,nil,3]]]
# p random_thing.size
# # array_of_arrays = [[]]

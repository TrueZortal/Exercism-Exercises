class Bst
    # attr_reader :data, :left, :right

    def initialize(initial_value)
        @start = Node.new(initial_value)
    end

    def data
        @start.data
    end

    def left 
        @start.left
    end

    def right
        @start.right
    end

    def each
        @start.nodes.map {|elem| elem.data}
    end

    def insert(inserted_value)
        if inserted_value > data
            if @start.right.nil?
                @start.right = Node.new(inserted_value)
            else
                if inserted_value > @start.right.data
                    @start.right.right = Node.new(inserted_value)
                else
                    @start.right.left = Node.new(inserted_value)
                end
            end
        else
            if @start.left.nil?
                @start.left = Node.new(inserted_value)
            else
                if inserted_value > @start.left.data
                    @start.left.right = Node.new(inserted_value)
                else
                    @start.left.left = Node.new(inserted_value)
                end
            end
        end
    end
end

class Node
    attr_reader :data
    attr_accessor :left, :right
    @@nodes = []
    def initialize(value)
        @data = value
        @left = nil
        @right = nil
        @@nodes << value
        p @@nodes
    end

    def nodes
        @@nodes
    end
end
class Bst
    # attr_reader :data, :left, :right

    def initialize(initial_value)
        @start = Node.new(initial_value)
        @current_node = @start
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
        array_of_datum = []
        visited_nodes =[]
        
    end

    def insert(inserted_value)
        set_current_node_to_a_valid_data_entry_point(inserted_value)
        insert_in_the_right_branch(inserted_value)
        reset_tree
    end

    private

    def set_current_node_to_a_valid_data_entry_point(inserted_value)
        until inserted_value > @current_node.data && @current_node.right.nil? || inserted_value <= @current_node.data && @current_node.left.nil?
            if inserted_value > @current_node.data
                p "moving from #{@current_node.data} to #{@current_node.right.data}"
                @current_node = @current_node.right
            else
                p "moving from #{@current_node.data} to #{@current_node.left.data}"
                @current_node = @current_node.left
            end
        end
    end

    def insert_in_the_right_branch(inserted_value)
        if inserted_value > @current_node.data
            p "inserting #{inserted_value} to the right of #{@current_node.data}"
            @current_node.right = Node.new(inserted_value)
        else
            p "inserting #{inserted_value} to the left of #{@current_node.data}"
            @current_node.left = Node.new(inserted_value)
        end
    end

    def reset_tree
        @current_node = @start
    end
end

class Node
    attr_reader :data
    attr_accessor :left, :right
    def initialize(value)
        @data = value
        @left = nil
        @right = nil
    end
end
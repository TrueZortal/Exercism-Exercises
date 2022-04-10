# frozen_string_literal: true

class Bst
  def initialize(initial_value)
    @start = Node.new(initial_value)
    @current_node = @start
    @all_nodes = [@start]
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
    return to_enum(:each) unless block_given?

    sort
    @all_nodes.each do |node|
      yield node.data
    end
  end

  def insert(inserted_value)
    set_current_node_to_a_valid_data_entry_point(inserted_value)
    insert_in_the_right_branch(inserted_value)
    reset_tree
  end

  private

  def sort
    @all_nodes.sort! { |a, b| a.data <=> b.data }
  end

  def set_current_node_to_a_valid_data_entry_point(inserted_value)
    until inserted_value > @current_node.data && @current_node.right.nil? || inserted_value <= @current_node.data && @current_node.left.nil?
      @current_node = if inserted_value > @current_node.data
                        @current_node.right
                      else
                        @current_node.left
                      end
    end
  end

  def insert_in_the_right_branch(inserted_value)
    if inserted_value > @current_node.data
      @current_node.right = Node.new(inserted_value)
      @all_nodes << @current_node.right
    else
      @current_node.left = Node.new(inserted_value)
      @all_nodes << @current_node.left
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

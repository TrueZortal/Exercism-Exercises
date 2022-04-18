class Deque
  attr_reader :array

  def initialize
    @array = []
  end

  def push(value)
    @array << Element.new(value)
    if @array[@array.size-2] != nil
      @array[@array.size-2].next = @array[@array.size-1]
      @array[@array.size-1].previous = @array[@array.size-2]
    end

  end

  def pop
    popped = @array.delete_at(@array.size-1).value
    if array_is_not_empty?
      @array.last.next = nil
    end
    popped
  end

  def shift
    shifted = @array.delete_at(0).value
    if array_is_not_empty?
      @array.first.previous = nil
    end
    shifted
  end

  def unshift(value)
    @array.unshift(Element.new(value))
    if @array[1] != nil
      @array[1].previous = @array[0]
      @array[0].next = @array[1]
    end
  end

  def array_is_not_empty?
    !@array.empty?
  end

  class Element
    attr_reader :value
    attr_accessor :previous, :next

    def initialize(value)
      @value = value
      @previous = nil
      @next = nil
    end
  end
end

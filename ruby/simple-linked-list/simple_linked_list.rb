# frozen_string_literal: true

class Element
  attr_accessor :datum, :next, :previous

  def initialize(data)
    @datum = data
    @next = nil
    @previous = nil
  end
end

class SimpleLinkedList
  def initialize(array = [])
    @array = []
    if array != []
      array.each do |elem|
        @array << Element.new(elem)
      end
    end
  end

  def push(elem)
    if @array.length.zero?
      @array[@array.length] = elem
    else
      @array[@array.length - 1].next = elem
      @array[@array.length] = elem
      elem.previous = @array
    end
    self
  end

  def pop(x = 0)
    return nil if x >= @array.size

    if x.zero?
      temp = @array[@array.size - 1]
      @array.delete_at(@array.size - 1)
      temp
    else
      @array[(@array.size - 1 - x)..(@array.size - 1)]
    end
  end

  def to_a
    @array.reverse.map(&:datum)
  end

  def reverse!
    array = []
    @array.each do |x|
      temp = x.next
      x.next = x.previous
      x.next = temp
      array.unshift(x)
    end
    @array = array
    self
  end
end

class CircularBuffer

  class BufferEmptyException < StandardError
  end

  def initialize(cells)
    @cells = cells
    clear
  end

  def write(elem)
    @buffer.each do |storage|
      if storage.empty?
        storage << Element.new(elem)
      else
        next
      end
      break
    end
    # p @buffer
  end

  def read
    raise BufferEmptyException if @buffer.all? {|x| x.empty?}

    result = String.new
    @buffer.each do |read_elem|
      if !read_elem.empty?
        result << read_elem.pop.value
      else
        next
      end
      break
    end
    # p result
    result
  end

  def clear
    @buffer = []
    1.upto(@cells) do
      @buffer << []
    end
  end
end



class Element
  attr_reader :value, :time
  def initialize(elem)
    @value = elem
    @time = Process. clock_gettime(Process::CLOCK_MONOTONIC)
  end
end
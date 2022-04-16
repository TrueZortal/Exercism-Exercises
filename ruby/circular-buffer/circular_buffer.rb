# frozen_string_literal: true

class CircularBuffer
  class BufferEmptyException < StandardError
  end

  class BufferFullException < StandardError
  end

  def initialize(cells)
    @cells = cells
    clear
  end

  def write(elem)
    raise BufferFullException if @buffer.all? { |x| !x.empty? }

    @buffer.each do |storage|
      next unless storage.empty?

      storage << Element.new(elem)
      break
    end
  end

  def write!(elem)
    if @buffer.any?(&:empty?)
      write(elem)
    else
      sort_by_time
      @buffer[0] = [Element.new(elem)]
    end
  end

  def read
    raise BufferEmptyException if @buffer.all?(&:empty?)

    result = String.new
    sort_by_time
    @buffer.each do |read_elem|
      next if read_elem.empty?

      result << read_elem.pop.value
      break
    end
    result
  end

  def clear
    @buffer = []
    1.upto(@cells) do
      @buffer << []
    end
  end

  private

  def sort_by_time
    empties = @buffer.select(&:empty?)
    @buffer -= empties
    @buffer.sort! { |x, y| x[0].time <=> y[0].time }
    @buffer += empties
  end
end

class Element
  attr_reader :value, :time

  def initialize(elem)
    @value = elem
    @time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  end
end

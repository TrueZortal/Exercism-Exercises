class ListOps

  def self.arrays(array)
    index = 0
    array.each do |x|
      index += 1
    end
    index
  end

  def self.reverser(flippy_something)
    array = []
    flippy_something.each do |x|
      array.unshift(x)
    end
    array
  end

  def self.concatter(array1, array2)
    array1 + array2
  end

  def self.mapper(mappy_thing_to_map, &block)
    array = []
    mappy_thing_to_map.each do |x|
      array << block[x]
    end
    array
  end

  def self.filterer(thing_to_filter, &block)
    array = []
    thing_to_filter.each do |x|
      if block[x]
      array << x
      end
    end
    array
  end

  def self.sum_reducer(thing_to_sum)
    base = 0
    thing_to_sum.each do |x|
      base += x
    end
    base
  end

  def self.factorial_reducer(thing_to_factor)
    base = 1
    thing_to_factor.each do |x|
      base *= x
    end
    base
  end
end


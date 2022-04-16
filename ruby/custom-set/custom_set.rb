class CustomSet
  attr_reader :set

  def initialize(set = [])
    @set = set

  end

  def empty?
    return false unless @set == []

    true
  end

  def member?(element)
    set.any?(element)
  end

  def subset?(another_set)
    return true if set == []

    another_set.difference(self).set.size == another_set.set.size - set.size
  end

  def disjoint?(another_set)
    another_set.difference(self).set == another_set.set
  end

  def intersection(another_set)
    CustomSet.new(another_set.set.select {|element| @set.include?(element)})
  end

  def difference(another_set)
    temp_diff = []
    set.each do |element|
      next if another_set.set.include?(element)

      temp_diff << element
    end

    CustomSet.new(temp_diff)
  end

  def union(another_set)
    temp = set
    another_set.set.each do |element|
      add(element)
    end
    return CustomSet.new(@set)
    set = temp
  end

  def add(elem)
    if !set.include?(elem)
      set << elem
      set.sort
    end
    self
  end

  def ==(other)
    if other.class == self.class
      other.set.sort == self.set.sort
    else
      false
    end
  end

end


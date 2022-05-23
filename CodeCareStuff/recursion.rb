class Recursion
  def self.silnia(number)
    return 1 if number == 1

    silnia(number - 1) * number
    # [*(1..number)].reduce(&:*)
  end

  def self.fibonacci(number)
    return 1 if number <= 1

    fibonacci(number - 1) + fibonacci(number - 2)
  end

  def self.length(array)
    return 0 if array == []

    _head, *tail = array
    1 + length(tail)
    # the_same_array_without_the_first_element_previously_known_as_head = array[1..array.size]
    # 1 + length(the_same_array_without_the_first_element_previously_known_as_head)
    # [Head|Tail]
  end

  def self.max(array)
    return array.first if array.size <= 1

    head, *tail = array
    # p "#{head} | #{tail}"cd
    max_of_tail = max(tail)
    if head < max_of_tail
      # p "#{head} < #{max_of_tail}"
      max_of_tail
    else
      # p "#{head} < #{max_of_tail} (else)"
      head
    end
    # if max([array[0]]) < max([array[1]])
    # end
    # [Head|Tail]

  end

  def self.flatten(array)
    return [] if array == []

    flatten(array)
  end
end



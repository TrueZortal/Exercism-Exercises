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
    stateful_flatten(array, [])
  end

  # def self.moj_reduce(array, accumulator)
  #   array.each do |x|
  #     accumulator << yield(accumulator, x)
  #   end
  # end

  private

  def self.stateful_flatten(array, accumulator)
    return accumulator if array == []

    head, *tail = *array
    if !head.respond_to?('each')
      accumulator << head
    elsif !head.empty?
      current_state = stateful_flatten(head, [])
      if current_state.size == 1
        accumulator << current_state.first
      else
        current_state.each do |elem|
          accumulator << elem
        end
      end
    end
    stateful_flatten(tail, accumulator)
  end
end


# p Recursion.moj_reduce([1,2,3],[]) {|acc,y| acc + y }


# p [1,2,3].reduce(&:+)
# [1,[2,[3]]]


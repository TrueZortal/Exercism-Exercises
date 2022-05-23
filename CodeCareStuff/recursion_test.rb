require 'minitest/autorun'
require_relative 'recursion'

class RecursionTest < Minitest::Test
  def test_silnia_of_1
    answer = Recursion.silnia(1)
    assert_equal 1, answer
  end

  def test_silnia_of_2
    answer = Recursion.silnia(2)
    assert_equal 2, answer
  end

  def test_silnia_of_3
    # skip
    answer = Recursion.silnia(3)
    assert_equal 6, answer
  end

  def test_silnia_of_5
    # skip
    answer = Recursion.silnia(5)
    assert_equal 120, answer
  end

  def test_fibonacci_of_0
    answer = Recursion.fibonacci(0)
    assert_equal 1, answer
  end

  def test_fibonacci_of_1
    # skip
    answer = Recursion.fibonacci(1)
    assert_equal 1, answer
  end

  def test_fibonacci_of_2
    # skip
    answer = Recursion.fibonacci(2)
    assert_equal 2, answer
  end

  def test_fibonacci_of_3
    # skip
    answer = Recursion.fibonacci(3)
    assert_equal 3, answer
  end

  def test_fibonacci_of_5
    # skip
    answer = Recursion.fibonacci(5)
    assert_equal 8, answer
  end

  def test_fibonacci_of_10
    # skip
    answer = Recursion.fibonacci(10)
    assert_equal 89, answer
  end

  def test_length_0_elem
    # skip
    answer = Recursion.length([])
    assert_equal 0, answer
  end

  def test_length_1_elem
    # skip
    answer = Recursion.length([1])
    assert_equal 1, answer
  end

  def test_length_2_elem
    # skip
    answer = Recursion.length([ 1, 2 ])
    assert_equal 2, answer
  end

  def test_length_4_elem
    # skip
    answer = Recursion.length([ 1,3,5,9 ])
    assert_equal 4, answer
  end

  def test_length_50_elem
    # skip
    answer = Recursion.length([*(0..49)])
    assert_equal 50, answer
  end

  def test_max_1_elem
    skip
    answer = Recursion.max([1])
    assert_equal 1, answer
  end

  def test_max_2_elem
    skip
    answer = Recursion.max([1, 3])
    assert_equal 3, answer
  end

  def test_max_from_sorted_array
    skip
    answer = Recursion.max([1,2,3,4,5])
    assert_equal 5, answer
  end

  def test_max_from_unsorted_array
    # skip
    answer = Recursion.max([1,7,2,5,11,666,6,3])
    assert_equal 666, answer
  end

  def test_flatten_empty_array
    # skip
    answer = Recursion.flatten([])
    assert_equal [], answer
  end

  def test_flatten_array_1_elem
    skip
    answer = Recursion.flatten([1])
    assert_equal [1], answer
  end

  def test_flatten_multiple_elems
    skip
    answer = Recursion.flatten([1, 2, 3])
    assert_equal [1, 2, 3], answer
  end

  def test_flatten_nested_empty
    skip
    answer = Recursion.flatten([[]])
    assert_equal [], answer
  end

  def test_flatten_nested_individual_elements
    skip
    answer = Recursion.flatten([[1],[2],[3]])
    assert_equal [1, 2, 3], answer
  end

  def test_flatten_multiple_nested
    skip
    answer = Recursion.flatten([1,[2,[3]]])
    assert_equal [1, 2, 3], answer
  end

end
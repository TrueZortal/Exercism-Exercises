require 'minitest/autorun'
require_relative 'largest_series_product'

# Common test data version: 1.2.0 85da7a5
class LargestSeriesProductTest < Minitest::Test
  def test_finds_the_largest_product_if_span_equals_length
    # skip
    assert_equal 18, Series.new('29').largest_product(2)
  end

  def test_can_find_the_largest_product_of_2_with_numbers_in_order
    # skip
    assert_equal 72, Series.new('0123456789').largest_product(2)
  end

  def test_can_find_the_largest_product_of_2 # rubocop:disable Naming/VariableNumber
    # skip
    assert_equal 48, Series.new('576802143').largest_product(2)
  end

  def test_can_find_the_largest_product_of_3_with_numbers_in_order
    # skip
    assert_equal 504, Series.new('0123456789').largest_product(3)
  end

  def test_can_find_the_largest_product_of_3 # rubocop:disable Naming/VariableNumber
    # skip
    assert_equal 270, Series.new('1027839564').largest_product(3)
  end

  def test_can_find_the_largest_product_of_5_with_numbers_in_order
    # skip
    assert_equal 15_120, Series.new('0123456789').largest_product(5)
  end

  def test_can_get_the_largest_product_of_a_big_number
    # skip
    assert_equal 23_520, Series.new('73167176531330624919225119674426574742355349194934').largest_product(6)
  end

  def test_reports_zero_if_the_only_digits_are_zero
    # skip
    assert_equal 0, Series.new('0000').largest_product(2)
  end

  def test_reports_zero_if_all_spans_include_zero
    # skip
    assert_equal 0, Series.new('99099').largest_product(3)
  end

  def test_rejects_span_longer_than_string_length
    # skip
    assert_raises(ArgumentError) do
      Series.new('123').largest_product(4)
    end
  end

  def test_reports_1_for_empty_string_and_empty_product_0_span
    # skip
    assert_equal 1, Series.new('').largest_product(0)
  end

  def test_reports_1_for_nonempty_string_and_empty_product_0_span
    # skip
    assert_equal 1, Series.new('123').largest_product(0)
  end

  def test_rejects_empty_string_and_nonzero_span
    # skip
    assert_raises(ArgumentError) do
      Series.new('').largest_product(1)
    end
  end

  def test_rejects_invalid_character_in_digits
    # skip
    assert_raises(ArgumentError) do
      Series.new('1234a5').largest_product(2)
    end
  end

  def test_rejects_negative_span
    # skip
    assert_raises(ArgumentError) do
      Series.new('12345').largest_product(-1)
    end
  end

  def test_solves_project_euler_problem_8
    #skip
    assert_equal 23_514_624_000, Series.new('73167176531330624919225119674426574742355349194934
      96983520312774506326239578318016984801869478851843
      85861560789112949495459501737958331952853208805511
      12540698747158523863050715693290963295227443043557
      66896648950445244523161731856403098711121722383113
      62229893423380308135336276614282806444486645238749
      30358907296290491560440772390713810515859307960866
      70172427121883998797908792274921901699720888093776
      65727333001053367881220235421809751254540594752243
      52584907711670556013604839586446706324415722155397
      53697817977846174064955149290862569321978468622482
      83972241375657056057490261407972968652414535100474
      82166370484403199890008895243450658541227588666881
      16427171479924442928230863465674813919123162824586
      17866458359124566529476545682848912883142607690042
      24219022671055626321111109370544217506941658960408
      07198403850962455444362981230987879927244284909188
      84580156166097919133875499200524063689912560717606
      05886116467109405077541002256983155200055935729725
      71636269561882670428252483600823257530420752963450').largest_product(13)
    end
end

# frozen_string_literal: true

class PerfectNumber
  def self.classify(number)
    raise RuntimeError unless number.positive?

    @number = number
    if perfect?
      'perfect'
    elsif deficient?
      'deficient'
    elsif abundant?
      'abundant'
    end
  end

  def self.perfect?
    @number == find_factors(@number)
  end

  def self.deficient?
    @number > find_factors(@number)
  end

  def self.abundant?
    @number < find_factors(@number)
  end

  def self.find_factors(number)
    index = 1
    factors = []
    1.upto(number - 1) do
      factors << index if (number % index).zero?
      index += 1
    end
    factors.sum
  end
end

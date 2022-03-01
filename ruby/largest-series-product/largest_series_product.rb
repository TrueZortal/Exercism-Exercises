# frozen_string_literal: true

class Series
  def initialize(numbers)
    raise ArgumentError unless numbers.upcase == numbers && numbers.downcase == numbers

    @numbers = numbers.split(/[^\d]/).join.chars.map(&:to_i)
  end

  def largest_product(of_how_many)
    raise ArgumentError unless of_how_many.to_i >= 0 && of_how_many.to_i <= @numbers.length

    array_of_products = []
    @index = 0
    if of_how_many.zero?
      array_of_products = [1]
    else
      @numbers.each do |_x|
        if @numbers[@index + of_how_many - 1].nil?
          break
        else
          array_of_products << compute_the_product(of_how_many)
        end

        @index += 1
      end
    end
    array_of_products.max
  end

  private

  def compute_the_product(limit)
    temp_array = []
    temp_order_tracker = @index
    temp_order_tracker.upto(temp_order_tracker + limit - 1) do
      temp_array << @numbers[temp_order_tracker]
      temp_order_tracker += 1
    end
    temp_array.reduce(:*)
  end
end

class Year
  def self.leap?(given_value)
    @given_value = given_value.to_i
    divisible_by_4 = @given_value % 4 == 0
    not_divisible_by_100 = @given_value % 100 != 0
    divisible_by_400 = @given_value % 400 == 0
    if divisible_by_4
      if not_divisible_by_100
        true
      elsif not_divisible_by_100 && divisible_by_400
        true
      elsif not_divisible_by_100 == false && divisible_by_400
        true
      else
        false
      end
    else
      false
    end
  end
end



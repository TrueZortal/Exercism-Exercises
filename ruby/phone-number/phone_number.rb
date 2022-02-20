# frozen_string_literal: true

class PhoneNumber
  def self.clean(phone_number)
    @struct_test = phone_number.split(/[^0-9]/).join.chars.map(&:to_i)
    check_conditions ? @struct_test.last(10).join : nil
  end

  private

  def self.check_conditions
    exchange_code_and_area_code_are_valid = @struct_test.last(10)[0].between?(2, 9) && @struct_test.last(10)[3].between?(2, 9)
    case @struct_test.length
    when 10
      exchange_code_and_area_code_are_valid
    when 11
      exchange_code_and_area_code_are_valid && @struct_test[0] == 1
    end
  end
end

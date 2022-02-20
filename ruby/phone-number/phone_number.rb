# frozen_string_literal: true

class PhoneNumber
  def self.clean(phone_number)
    @phone_number_array_clean_string = phone_number.split(/[^0-9]/).join
    @struct_test = @phone_number_array_clean_string.chars.map(&:to_i)
    if @phone_number_array_clean_string.length == 10 && @struct_test[0].between?(2,9) && @struct_test[3].between?(2, 9)
      @phone_number_array_clean_string
    elsif @phone_number_array_clean_string.length == 11
      if @struct_test[0] != 1
        # do nothing
      elsif @struct_test[0] == 1 && @struct_test[1].between?(2, 9) && @struct_test[4].between?(2, 9)
        @phone_number_array_clean_string[1, 10]
      end
    else
      #do nothing
    end
  end
end

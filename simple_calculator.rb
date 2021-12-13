class SimpleCalculator
  class UnsupportedOperation < StandardError
  end
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze
  def self.calculate(first_operand, second_operand, operation)
    raise ArgumentError if first_operand.is_a?(String) || second_operand.is_a?(String)
    begin
      if ALLOWED_OPERATIONS.include?operation
        if operation == '+'
          "#{first_operand} + #{second_operand} = #{first_operand.to_i + second_operand.to_i}"
        elsif operation == '/'
          "#{first_operand} / #{second_operand} = #{first_operand.to_i / second_operand.to_i}"
        elsif operation == '*'
          "#{first_operand} * #{second_operand} = #{first_operand.to_i * second_operand.to_i}"
        end
      else
        raise UnsupportedOperation
      end
    rescue ZeroDivisionError
    "Division by zero is not allowed."
    end
  end
end
class Luhn
  def self.valid?(text)
    @text = text.gsub(/[[:space:]]/, '').strip.chars.reverse
      if @text.length > 1 && @text.any?(/[^0-9 ]/) == false
        index = 0
        verify_validity = []
        while index < @text.length do
          verify_validity << @text[index].to_i
          index += 1
            if  @text[index].to_i * 2 > 9
            verify_validity << @text[index].to_i * 2 - 9
            else
            verify_validity << @text[index].to_i * 2
            end
          index += 1
        end
        verify_validity.map! {|x| x.to_i}.sum.modulo(10) == 0
      else
      false
      end
    end
  end


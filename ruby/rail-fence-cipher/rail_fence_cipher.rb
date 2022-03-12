class RailFenceCipher
    
    def self.encode(message, rails)
        @message = message.chars
        @array_of_rails = Array.new(rails) { [] }
        establish_code_pattern(rails)
        # p @array_of_rails
        # @array_of_rails[@encoding_pattern[1 % @encoding_pattern.size]] << 'x'
        # p @array_of_rails[@encoding_pattern[1 % @encoding_pattern.size]] 
        @message.each_with_index do |char, index|
            @array_of_rails[@encoding_pattern[index % @encoding_pattern.size]] << char
        end
        @array_of_rails.join
    end

    def self.decode (cipher, cipherrails)
    @array_of_cipherrails = Array.new(cipherrails){ [] }
    cipher != '' ? cipher.chars.each_slice(cipher.length/cipherrails).to_a.transpose.join : ''
    
    end

    def self.establish_code_pattern(number_of_rails)
        up = *(1..number_of_rails).to_a
        down = *(2..number_of_rails-1).to_a.reverse
        @encoding_pattern = up + down
        @encoding_pattern.map! { |x| x-1}
        # p @encoding_pattern
    end
end
# RailFenceCipher.decode('XXXXXXXXXOOOOOOOOO', 2)
# 1 2 3 4 5 6 7 8 9
# 1 2 3 2 1 2 3 2 1

# 1 2 3 4 5 6 7 8 9
# 1 2 3 4 3 2 1 2 

# THED EVIL ISIN THED ETAI LS
# 1232 1232 1232 1232 1232 12
# 1234 5678


# THEDEVIL ISINTHED ETAILS
# 12345432 12345432 123454
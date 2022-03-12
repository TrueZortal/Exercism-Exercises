class RailFenceCipher
    
    def self.encode(message, rails)
        @message = message.chars
        @array_of_rails = Array.new(rails) { [] }
        establish_code_pattern(rails)
        @message.each_with_index do |char, index|
            @array_of_rails[@encoding_pattern[index % @encoding_pattern.size]] << char
        end
        @array_of_rails.join
    end

    def self.decode (cipher, cipherrails)
    @array_of_cipherrails = Array.new(cipherrails){ [] }
    @cipher = cipher.chars
    solution = String.new
    decoding_pattern = []
    establish_code_pattern(cipherrails)
    @cipher.each_with_index do |char, index|
        decoding_pattern << @encoding_pattern[index % @encoding_pattern.size]
    end
    decoding_pattern.sort.each_with_index do |char, index|
        @array_of_cipherrails[char] << @cipher[index]  
    end
    decoding_pattern.each do |char|
        solution << @array_of_cipherrails[char][0].to_s
        @array_of_cipherrails[char].delete_at(0)
    end
    solution
    end

    def self.establish_code_pattern(number_of_rails)
        up = *(1..number_of_rails).to_a
        down = *(2..number_of_rails-1).to_a.reverse
        @encoding_pattern = up + down
        @encoding_pattern.map! { |x| x-1}
    end
end
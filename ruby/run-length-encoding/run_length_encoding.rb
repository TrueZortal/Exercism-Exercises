class RunLengthEncoding
    def self.encode(string)
        @string = string.chars
        @answer = []
        @char_set = []
        p @string
        @string.each do |char|
            if !@char_set.empty? && !@char_set.include?(char)
                if @char_set.size == 1
                    @answer << @char_set.join
                    @char_set = []
                else
                    @answer << "#{@char_set.size}#{@char_set[0]}"
                    @char_set = []
                end
            else
                @char_set << char
            end
        end
        p @answer.join
    end
end
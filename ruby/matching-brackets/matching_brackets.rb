class Brackets
  @@hash_of_pairs_of_brackest = {
    '[' => ']',
    '(' => ')',
    '{' => '}'
  }
  @@keys = @@hash_of_pairs_of_brackest.keys
  @@values = @@hash_of_pairs_of_brackest.values

  def self.paired?(string)
    @check_nested = 0
    @brackets = @@keys + @@values
    @array_of_brackets =  string.chars.map {|x| @brackets.include?(x) ? x : ''}.reject(&:empty?)
    if @array_of_brackets.size % 2 != 0
      return false
    else
      @array_of_brackets.each_with_index do |bracket, index|
        if @@values.include?(bracket)
          return false
        elsif @@keys.include?(bracket)
          inner_index = index
          @check_nested = 0
          index.upto(@array_of_brackets.size) do
            inner_index += 1
            if @@keys.include?(bracket) && @array_of_brackets[inner_index] == @@hash_of_pairs_of_brackest[bracket]
              if @check_nested % 2 == 0
              @array_of_brackets[index] = 'X'
              @array_of_brackets[inner_index] = 'X'
              break
              else
                return false
              end
            else
              @check_nested += 1
            end
          end
        end
      end
    end
      @array_of_brackets.all? { |x| x == 'X'}
    end

end

class Brackets
  @@hash_of_pairs_of_brackest = {
    '[' => ']',
    '(' => ')',
    '{' => '}'
  }
  @@keys = @@hash_of_pairs_of_brackest.keys
  @@values = @@hash_of_pairs_of_brackest.values

  # p @@hash_of_pairs_of_brackest['[']

  def self.paired?(string)
    @brackets = @@keys + @@values
    @array_of_brackets =  string.chars.map {|x| @brackets.include?(x) ? x : ''}.reject(&:empty?)
    # p @array_of_brackets
    if @array_of_brackets.size % 2 != 0
      return false
    else
      @array_of_brackets.each_with_index do |bracket, index|
        if @@values.include?(bracket)
          return false
        elsif @@keys.include?(bracket)
          #match value and remove both from array
          inner_index = index
          # p @array_of_brackets
          index.upto(@array_of_brackets.size) do
            inner_index += 1
            if @@keys.include?(bracket) && @array_of_brackets[inner_index] == @@hash_of_pairs_of_brackest[bracket]
              # p number_of_closing == number_of_opening
              @array_of_brackets[index] = 'X'
              @array_of_brackets[inner_index] = 'X'
              break
            end
          end
        end
      end
    end
      @array_of_brackets.all? { |x| x == 'X'}
    end

end

# Brackets.paired?('(((185 + 223.85) * 15) - 543)/2')

Brackets.paired?('[({]})')

#[] {} ()

# Brackets.paired?('([{}({}[])])tomatosuperduper1231212heyhey')

# Brackets.paired?('[]')

# Brackets.paired?('{[]}')

# Brackets.paired?('[[')
# Brackets.paired?('([{}({}[])])')
class Phrase

  def initialize(string)
    @string = string
  end

  def word_count
    breakdown_of_string = @string.downcase.strip.scan(/\b[\w']+\b/)
    index = 0
    result = {}
    while index < breakdown_of_string.length do
      result[breakdown_of_string[index]] = breakdown_of_string.count(breakdown_of_string[index])
      index += 1
    end
    result
  end
end


class Pangram
  def self.pangram?(given_input)
    alphabet = ('a'..'z').map {|i| i}
    alphabet & given_input.downcase.strip.chars == alphabet
  end
end


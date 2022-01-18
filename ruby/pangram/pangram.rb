# frozen_string_literal: true

class Pangram
  def self.pangram?(given_input)
    alphabet = ('a'..'z').to_a
    alphabet & given_input.downcase.strip.chars == alphabet
    # alternate solution using -
    # alphabet - given_input.downcase.strip.chars == []
  end
end

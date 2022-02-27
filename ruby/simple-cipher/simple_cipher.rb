# frozen_string_literal: true

class Cipher
  numbers = *(0..25)
  alphabet = *('a'..'z')
  @@alphabet_numbers_match = numbers.zip(alphabet).to_h

  attr_reader :key

  def initialize(input = generate_key)
    raise ArgumentError if !input.nil? && !(input.split(/[a-z]/).empty? && input != '')

    @key = input
  end

  def generate_key
    automated_key = String.new
    0.upto(100) do
      automated_key << @@alphabet_numbers_match[rand(26)]
    end
    automated_key
  end

  def encode(plaintext)
    plaintext.chars.each_with_index.map do |x, i|
      @@alphabet_numbers_match[(@@alphabet_numbers_match.key(x) + @@alphabet_numbers_match.key(@key[i % @key.length])) % 26]
    end.join
  end

  def decode(ciphertext)
    ciphertext.chars.each_with_index.map do |x, i|
      @@alphabet_numbers_match[(@@alphabet_numbers_match.key(x) - @@alphabet_numbers_match.key(@key[i % @key.length])) % 26]
    end.join
  end
end

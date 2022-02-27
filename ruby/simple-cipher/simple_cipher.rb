class Cipher

  numbers = *(0..25)
  alphabet = *('a'..'z')
  $alphabet_numbers_match = numbers.zip(alphabet).to_h

  attr_reader :key

  def initialize(input = self.generate_key)
  raise ArgumentError unless (input.split(/[a-z]/).empty? && input != '') if input != nil

  @key = input
  end

  def generate_key
    automated_key = String.new
    0.upto(100) do
      automated_key << $alphabet_numbers_match[rand(26)]
    end
    automated_key
  end

  def encode(plaintext)
    plaintext.chars.each_with_index.map {|x, i| x = $alphabet_numbers_match[($alphabet_numbers_match.key(x)+$alphabet_numbers_match.key(@key[i % @key.length])) % 26]}.join
  end

  def decode(ciphertext)
    ciphertext.chars.each_with_index.map {|x, i| x = $alphabet_numbers_match[($alphabet_numbers_match.key(x)-$alphabet_numbers_match.key(@key[i % @key.length])) % 26]}.join
  end
end




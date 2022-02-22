# frozen_string_literal: true

class Bob
  def self.hey(message)
    if message.downcase != message && message.upcase == message && message.strip.chars.last == '?' # ? and Capital
      "Calm down, I know what I'm doing!"
    elsif message.strip.chars.last == '?' # ?
      'Sure.'
    elsif message.upcase == message && message.downcase != message # capital
      'Whoa, chill out!'
    elsif message.strip == '' # ""
      'Fine. Be that way!'
    else # anything else
      'Whatever.'
    end
  end
end

frozen_string_literal: true
# Implementation of the Bob exercise in Ruby track on Exercism.
class Bob
  DEFAULT_RESPONSE = 'Whatever.'
  RESPONSE_TO_SILENCE = 'Fine. Be that way!'
  RESPONSE_TO_YELLING = 'Whoa, chill out!'
  RESPONSE_TO_QUESTION = 'Sure.'
  RESPONSE_TO_FORCEFUL_QUESTION = "Calm down, I know what I'm doing!"
  private_constant :DEFAULT_RESPONSE
  private_constant :RESPONSE_TO_SILENCE
  private_constant :RESPONSE_TO_YELLING
  private_constant :RESPONSE_TO_QUESTION
  private_constant :RESPONSE_TO_FORCEFUL_QUESTION
  class << self
    # @param greeting [String]
    # @return [String]
    def hey(greeting)
      return RESPONSE_TO_SILENCE if silence_in(greeting)
      return RESPONSE_TO_FORCEFUL_QUESTION if forceful_question_in(greeting)
      return RESPONSE_TO_YELLING if yelling_in(greeting)
      return RESPONSE_TO_QUESTION if question_in(greeting)
      DEFAULT_RESPONSE
    end
    private
    def silence_in(sentence)
      sentence.strip.empty?
    end
    def forceful_question_in(sentence)
      yelling_in(sentence) && question_in(sentence)
    end
    def question_in(sentence)
      sentence.strip.chars.last == '?'
    end
    def yelling_in(sentence)
      sentence.scan(/[a-z]+/).empty? && !sentence.scan(/[A-Z]+/).empty?
    end
  end
end
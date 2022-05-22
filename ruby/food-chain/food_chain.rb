# frozen_string_literal: true

class FoodChain
  def self.song
    all_them_animals = [
      ['fly', "I don't know why she swallowed the fly. Perhaps she'll die."],
      ['spider', 'It wriggled and jiggled and tickled inside her.'],
      ['bird', 'How absurd to swallow a bird!'],
      ['cat', 'Imagine that, to swallow a cat!'],
      ['dog', 'What a hog, to swallow a dog!'],
      ['goat', 'Just opened her throat and swallowed a goat!'],
      ['cow', "I don't know how she swallowed a cow!"]
    ]

    song = String.new
    all_the_swallowed_things = String.new
    all_them_animals.each_with_index do |animol, index|
      song << "I know an old lady who swallowed a #{animol[0]}.\n"
      song << "#{animol[1]}\n"
      previous_animol = all_them_animals[index - 1]
      if index.positive?
        all_the_swallowed_things << "She swallowed the #{animol[0]} to catch the #{if previous_animol[0] == 'spider'
                                                                                     previous_animol[0] + ' that ' + previous_animol[1][3,
                                                                                                                                        previous_animol[1].length - 1]
                                                                                   else
                                                                                     "#{previous_animol[0]}."
                                                                                   end}\n"
        song << all_the_swallowed_things.lines.reverse.join
        song << "#{all_them_animals[0][1]}\n"
      end
      song << "\n"
    end
    song << "I know an old lady who swallowed a horse.\nShe's dead, of course!\n"
    song
  end
end

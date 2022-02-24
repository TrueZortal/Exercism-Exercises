# frozen_string_literal: true

class BeerSong
  def self.recite(starting_verse, how_many)
    starting_verse = starting_verse
    printout = String.new
    1.upto(how_many) do |index|
      printout += case starting_verse
                  when 2
                    <<~TEXT
                      2 bottles of beer on the wall, 2 bottles of beer.
                      Take one down and pass it around, 1 bottle of beer on the wall.
                    TEXT

                  when 1
                    <<~TEXT
                      1 bottle of beer on the wall, 1 bottle of beer.
                      Take it down and pass it around, no more bottles of beer on the wall.
                    TEXT

                  when 0
                    <<~TEXT
                      No more bottles of beer on the wall, no more bottles of beer.
                      Go to the store and buy some more, 99 bottles of beer on the wall.
                    TEXT

                  else
                    <<~TEXT
                      #{starting_verse} bottles of beer on the wall, #{starting_verse} bottles of beer.
                      Take one down and pass it around, #{starting_verse - 1} bottles of beer on the wall.
                    TEXT

                  end
      printout += "\n" if index != how_many
      starting_verse -= 1
    end
    printout
  end
end

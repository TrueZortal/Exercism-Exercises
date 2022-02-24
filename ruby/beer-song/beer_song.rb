class BeerSong
  def self.recite(starting_verse, how_many)
    @starting_verse = starting_verse
    printout = String.new
    1.upto(how_many) do |index|
    if @starting_verse == 2
      printout += <<~TEXT
      2 bottles of beer on the wall, 2 bottles of beer.
      Take one down and pass it around, 1 bottle of beer on the wall.
    TEXT

    elsif @starting_verse == 1
      printout += <<~TEXT
      1 bottle of beer on the wall, 1 bottle of beer.
      Take it down and pass it around, no more bottles of beer on the wall.
    TEXT

    elsif @starting_verse == 0
      printout += <<~TEXT
      No more bottles of beer on the wall, no more bottles of beer.
      Go to the store and buy some more, 99 bottles of beer on the wall.
    TEXT

    else
      printout += <<~TEXT
      #{@starting_verse} bottles of beer on the wall, #{@starting_verse} bottles of beer.
      Take one down and pass it around, #{@starting_verse-1} bottles of beer on the wall.
      TEXT

    end
    printout += "\n" if index != how_many
      @starting_verse -= 1
    end
    printout
  end
end


# frozen_string_literal: true

class House
  def self.recite
    lines = [
      ['lay in', 'the house that Jack built.'],
      ['ate', 'the malt'],
      ['killed', 'the rat'],
      ['worried', 'the cat'],
      ['tossed', 'the dog'],
      ['milked', 'the cow with the crumpled horn'],
      ['kissed', 'the maiden all forlorn'],
      ['married', 'the man all tattered and torn'],
      ['woke', 'the priest all shaven and shorn'],
      ['kept', 'the rooster that crowed in the morn'],
      ['belonged to', 'the farmer sowing his corn'],
      ['', 'the horse and the hound and the horn']
    ]

    rhyme = String.new

    0.upto(lines.size - 1) do |line_number|
      rhyme << "This is #{lines[line_number][1]}\n"
      the_rest = (0..line_number - 1).to_a.reverse
      the_rest.each do |remaining_line|
        rhyme << "that #{lines[remaining_line][0]} #{lines[remaining_line][1]}\n"
      end
      rhyme << "\n" if line_number != lines.size - 1
    end
    rhyme
  end
end

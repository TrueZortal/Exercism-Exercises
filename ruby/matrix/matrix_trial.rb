#require 'matrix'

class Matrix
  def initialize(x)
    @x = x.split("\n")
    puts @x
    puts @x.class
    #@x = Matrix[*x.split("\n")] -> uzycie .class zeby zorientowac sie w transformacjach
    #matryca = Matrix[*@x]
    #puts @x.class
    #puts @x
  end
  # def self.new(y)
  #   require 'matrix'
  #  @y = Matrix[*y.split("\n")]
  # end
  # def rows(row = []) -> rows jest implicit metoda klasy Matrix w ruby ale moj class Matrix nie zachowuje sie jak klasa Matrix
  #   @row = row
  #   puts @row
  #   puts @row.class
  #   b = @x[@row[0]]
  #   puts b
  #   puts b.class
  # end
end

a = Matrix.new("9 8 7\n19 18 17")
puts a.class


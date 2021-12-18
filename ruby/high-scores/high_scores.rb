class HighScores
  def initialize(x) #watpliwosci odnosnie jak zadeklarowac array jako input
    @x = x
  end
  def latest
    @x.last
  end
  def personal_best
    @x.sort.reverse.first #tutaj chwile mi zajelo dojscie do wniosku ze sort sortuje odwrotnie niz bym chcial
  end
  def personal_top_three
    @x.sort.reverse.take(3)
  end
  def scores
    @x
  end
  def latest_is_personal_best?
    @x.last == @x.sort.reverse.first # Chcialem zrobic Ternary ale przypomnialem sobie lekcje
  end
end


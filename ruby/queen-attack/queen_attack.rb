class Queens
  def initialize(queens)
    raise ArgumentError unless queens.values.map {|v| check_if_positive_and_if_on_board(v)}.all?(true)

    @positions = queens.values
  end

  def attack?
    triangulate_enemy_positions_using_arcane_art_of_mathematics_and_power_of_friendship(@positions)
  end

  private

  def triangulate_enemy_positions_using_arcane_art_of_mathematics_and_power_of_friendship(array_of_two_elements_no_more_no_less_just_two)
    raise ArgumentError unless array_of_two_elements_no_more_no_less_just_two.size == 2

    check_column(array_of_two_elements_no_more_no_less_just_two) ||
    check_row(array_of_two_elements_no_more_no_less_just_two) ||
    check_diagonals(array_of_two_elements_no_more_no_less_just_two)
  end

  def check_column(array_of_two_elems)
    array_of_two_elems[0][1] == array_of_two_elems [1][1]
  end

  def check_row(array_of_two_elems)
    array_of_two_elems[0][0] == array_of_two_elems[1][0]
  end

  def check_diagonals(array_of_two_elems)
    array_of_two_elems[0].uniq.size == 1 && array_of_two_elems[1].uniq.size == 1 || array_of_two_elems.map(&:sum).uniq.size == 1
  end

  def check_if_positive_and_if_on_board(array)
    array.all? {|coordinate| coordinate >= 0 && coordinate < 8}
  end
end
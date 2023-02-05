defmodule Rules do
  def eat_ghost?(power_pellet_active, touching_ghost), do: power_pellet_active && touching_ghost

  def score?(touching_power_pellet, touching_dot), do: touching_power_pellet || touching_dot

  def lose?(power_pellet_active, touching_ghost), do: !power_pellet_active && touching_ghost

  def win?(has_eaten_all_dots, power_pellet_active, touching_ghost) do
    has_eaten_all_dots && !lose?(power_pellet_active, touching_ghost)
  end
end

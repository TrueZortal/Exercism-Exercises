defmodule KitchenCalculator do
  def get_volume(volume_pair), do: elem(volume_pair,1)

  def to_milliliter({:milliliter,_} = volume_pair), do: volume_pair
  def to_milliliter({:cup,_} = volume_pair), do: {:milliliter, (240 * get_volume(volume_pair))}
  def to_milliliter({:fluid_ounce,_} = volume_pair), do: {:milliliter, (30 * get_volume(volume_pair))}
  def to_milliliter({:teaspoon,_} = volume_pair), do: {:milliliter, (5 * get_volume(volume_pair))}
  def to_milliliter({:tablespoon,_} = volume_pair), do: {:milliliter, (15 * get_volume(volume_pair))}

  def from_milliliter(volume_pair, measure = :milliliter), do: volume_pair
  def from_milliliter(volume_pair, measure = :cup), do: {:cup, (get_volume(volume_pair)/240)}
  def from_milliliter(volume_pair, measure = :fluid_ounce), do: {:fluid_ounce, (get_volume(volume_pair)/30)}
  def from_milliliter(volume_pair, measure = :teaspoon), do: {:teaspoon, (get_volume(volume_pair)/5)}
  def from_milliliter(volume_pair, measure = :tablespoon), do: {:tablespoon, (get_volume(volume_pair)/15)}

  def convert(volume_pair, unit) do
    from_milliliter(to_milliliter(volume_pair), unit)
  end
end

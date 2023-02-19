defmodule BirdCount do
  def today([] = list), do: nil
  def today(list), do: hd(list)

  def increment_day_count([] = list), do: [1]
  def increment_day_count(list), do: [ hd(list)+1 | tl(list)]

  def has_day_without_birds?([] = _list), do: false
  def has_day_without_birds?([0 | _] = _list), do: true
  def has_day_without_birds?(list), do: has_day_without_birds?(tl(list))

  def total([] = list), do: 0
  def total(list) when length(list) == 1, do: hd(list)
  def total(list), do: total( [ (hd(list) + hd(tl(list))) | tl(tl(list)) ])

  def busy_days([] = _list), do: 0
  def busy_days(list) when length(list) == 1 and hd(list) > 4, do: 1
  def busy_days(list) do
    if length(list) == 1 and hd(list) <= 4 do
      0
    else
      cond do
        length(list) > 1 -> [hd(list)+1 | tl(tl(list))]
        length(list) == 1 -> hd(list)
      end
    end

  end
end

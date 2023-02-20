defmodule BirdCount do
  def today([] = _list), do: nil
  def today(list), do: hd(list)

  def increment_day_count([] = _list), do: [1]
  def increment_day_count(list), do: [ hd(list)+1 | tl(list)]

  def has_day_without_birds?([] = _list), do: false
  def has_day_without_birds?([0 | _] = _list), do: true
  def has_day_without_birds?(list), do: has_day_without_birds?(tl(list))

  def total([] = _list), do: 0
  def total(list) when length(list) == 1, do: hd(list)
  def total(list), do: total( [ (hd(list) + hd(tl(list))) | tl(tl(list)) ])

  def busy_days([] = _list), do: 0
  def busy_days([current | tbd]) when current >= 5, do: 1 + busy_days(tbd)
  def busy_days([_current | tbd]), do: busy_days(tbd)
end

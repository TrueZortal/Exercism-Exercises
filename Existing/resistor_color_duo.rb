class KeyNotIncluded < KeyError
end

class ResistorColorDuo
  $hash = {"black" => 0, "brown" => 1, "red" => 2, "orange" => 3, "yellow" => 4, "green" => 5, "blue" => 6, "violet" => 7, "grey" => 8, "white" => 9}
  def self.value(x = %w[])
  $hash.has_key?("#{x[0]}"&&"#{x[1]}") ? ("#{$hash.fetch("#{x[0]}")}#{$hash.fetch("#{x[1]}")}").to_i : "Key not included #{raise KeyNotIncluded}"
  end
end

puts ResistorColorDuo.value(%w[red blue])

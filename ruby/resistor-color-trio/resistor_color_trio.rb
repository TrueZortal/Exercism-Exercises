class ResistorColorTrio

  @@table = { 'black' => 0, 'brown' => 1, 'red' => 2, 'orange' => 3, 'yellow' => 4, 'green' => 5, 'blue' => 6,
    'violet' => 7, 'grey' => 8, 'white' => 9 }.freeze

  def initialize(array)
    raise ArgumentError unless array.all? {|x| @@table.include?(x)}

    @array_of_numeric_values = array.map {|x| @@table[x]}
    if @array_of_numeric_values[2] == 0
      @array_of_numeric_values.pop
    else
      @array_of_numeric_values[2] = '0' * @array_of_numeric_values[2]
    end
  end

  def label
    if @array_of_numeric_values.join.to_i > 1000
    "Resistor value: #{@array_of_numeric_values.join.to_i/1000} kiloohms"
    else
    "Resistor value: #{@array_of_numeric_values.join} ohms"
    end
  end
end
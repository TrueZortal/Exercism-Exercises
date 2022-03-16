class Board
  ALLOWED_CHARS = ['|', '-', '+', '*', ' ']

  def self.transform(input)
    raise ArgumentError unless input.min.length == input.max.length && input.join.chars.all? {|x| ALLOWED_CHARS.include?(x)} && input.first == input.last
    @array_of_rows = input.map {|x| x.chars}
    @frame = ['|', '-', '+']
    @da_bomb = '*'
    @empty = ' '
    @array_of_rows.each_with_index do |row, row_index|
      row.each_with_index do |elem, elem_index|
        if elem == @da_bomb
          temp_array_of_neightobring_rows = [row_index -1, row_index, row_index +1]
          temp_array_of_neighbors = [elem_index -1, elem_index, elem_index +1]
          temp_array_of_neightobring_rows.each do |neighboring_row|
            temp_array_of_neighbors.each do |neighboring_elem|
              if @array_of_rows[neighboring_row][neighboring_elem] != @da_bomb && !@frame.include?(@array_of_rows[neighboring_row][neighboring_elem])
                if @array_of_rows[neighboring_row][neighboring_elem] == ' '
                  @array_of_rows[neighboring_row][neighboring_elem] = 1
                else
                @array_of_rows[neighboring_row][neighboring_elem] += 1
                end
              end
            end
          end
        end
      end
    end
    @array_of_rows.map!(&:join)
  end
end


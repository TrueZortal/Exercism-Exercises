class Board
  def self.transform(input)
    raise ArgumentError unless input.min.length == input.max.length
    @array_of_rows = input.map {|x| x.chars}
    # p @array_of_rows
    @framing_chars = ['|', '-', '+']
    @da_bomb = '*'
    @empty = ' '
    @array_of_rows.each_with_index do |row, row_index|
      row.each_with_index do |elem, elem_index|
        if elem == @empty
          #do nothing
        elsif @framing_chars.include?(elem)
          #do nothing
        elsif elem == @da_bomb
          # temp_array = [
          # @array_of_rows[row_index -1][elem_index -1],
          # @array_of_rows[row_index -1][elem_index],
          # @array_of_rows[row_index -1][elem_index +1],
          # @array_of_rows[row_index][elem_index -1],
          # @array_of_rows[row_index][elem_index +1],
          # @array_of_rows[row_index -1][elem_index -1],
          # @array_of_rows[row_index -1][elem_index],
          # @array_of_rows[row_index -1][elem_index +1]
          # ]
          temp_array_of_neightobring_rows = [row_index -1, row_index, row_index +1]
          temp_array_of_neighbors = [elem_index -1, elem_index, elem_index +1]
          temp_array_of_neightobring_rows.each do |neighboring_row|
            temp_array_of_neighbors.each do |neighboring_elem|
              if @array_of_rows[neighboring_row][neighboring_elem] != @da_bomb && !@framing_chars.include?(@array_of_rows[neighboring_row][neighboring_elem])
                if @array_of_rows[neighboring_row][neighboring_elem] == ' '
                  @array_of_rows[neighboring_row][neighboring_elem] = 1
                else
                @array_of_rows[neighboring_row][neighboring_elem] += 1
                end
              end
            end
          end
          # p temp_array_of_neighbors
          # p  temp_array_of_neightobring_rows
          # row_index
          # row_index +1
          # row[elem_index-1] = row[elem_index-1].to_i + 1
          # row[elem_index+1] = row[elem_index+1].to_i + 1
        end
      end
    end
    @array_of_rows.map!(&:join)
    # p @array_of_rows.join("\n")
  end
end

inp = ['+------+', '| *  * |', '|  *   |', '|    * |', '|   * *|',
  '| *  * |', '|      |', '+------+']
  Board.transform(inp)
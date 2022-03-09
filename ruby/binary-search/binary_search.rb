class BinarySearch
  def initialize(values)
    @values = values.sort
  end

  def search_for(lost)
    @lost = lost
    @index = *(0..@values.size-1)
    @values_with_index = @values.zip(@index).to_h
    if @values == []
      return nil
    else
      if @lost == @values_with_index.key(halfway_point_value)
        halfway_point_value
      else
        until @lost == @values_with_index.key(halfway_point_value)
          if @values_with_index.size != 1 && @lost < @values_with_index.key(halfway_point_value)
            @values_with_index = @values_with_index.each_slice(half_of_the_hash).to_a[0].to_h
          elsif @values_with_index.size != 1 && @lost > @values_with_index.key(halfway_point_value)
            @values_with_index = @values_with_index.each_slice(half_of_the_hash).to_a[1].to_h
          else
            return nil
          end
        end
        @values_with_index.values.join.to_i
      end
    end
  end

  def halfway_point_value
    @values_with_index.to_a[@values_with_index.to_a.size/2.0.round][1]
  end

  def half_of_the_hash
    (@values_with_index.size/2.0).round
  end
end

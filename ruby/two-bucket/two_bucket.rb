class TwoBucket
  attr_reader :moves, :bucket1, :bucket2
  # attr array bucket[current, max]
  def initialize(bucket_1,bucket_2,goal,starting_point)
    @bucket_1_max, @bucket_2_max, @goal = bucket_1,bucket_2,goal
    @moves = 1
    if starting_point == 'one'
      @bucket1 = [ @bucket_1_max, @bucket_1_max ]
      @bucket2 = [ 0 , @bucket_2_max ]
    else
      @bucket1 = [ 0 , @bucket_1_max ]
      @bucket2 = [ @bucket_2_max , @bucket_2_max ]
    end

    # p bucket1
    # p bucket2
    # p full?(bucket1)
    # p full?(bucket2)
    # # pour_from_to_bucket(bucket1, bucket2)
    # p bucket1
    # p bucket2
    # index = 0
    # until @bucket1[0] == @goal || @bucket2[0] == @goal
    0.upto(10) do
      if full_and_empty(@bucket1, @bucket2)
        if full?(@bucket1)
          pour_from_to_bucket(@bucket1, @bucket2)
        else
          pour_from_to_bucket(@bucket2, @bucket1)
        end
        @moves += 1
        p "move:#{@moves} con 1 bucket1: #{@bucket1[0]} bucket2: #{@bucket2[0]}"
      elsif empty_and_non_empty_equal_to_another_bucket_max(@bucket1, @bucket2)
        if empty?(@bucket1)
          fill(@bucket1)
        elsif empty?(@bucket2)
          fill(@bucket2)
        end
        @moves += 1
        p "move:#{@moves} con 2 bucket1: #{@bucket1[0]} bucket2: #{@bucket2[0]}"
      elsif smaller_is_non_empty_and_bigger_is_full(@bucket1, @bucket2)
        if @bucket1[1] > @bucket2[1]
          pour_from_to_bucket(@bucket1,@bucket2)
        else
          pour_from_to_bucket(@bucket2,@bucket1)
        end
        @moves += 1
        p "move:#{@moves} con 2.5 bucket1: #{@bucket1[0]} bucket2: #{@bucket2[0]}"
      elsif smaller_is_non_empty_and_bigger_is_empty(@bucket1, @bucket2)
        if @bucket1[1] > @bucket2[1]
          fill(@bucket1)
        else
          fill(@bucket2)
        end
        @moves += 1
        p "move:#{@moves} con 3 bucket1: #{@bucket1[0]} bucket2: #{@bucket2[0]}"
      elsif empty_and_non_empty_not_equal_to_another_bucket_max(@bucket1, @bucket2)
        if empty?(@bucket1)
          pour_from_to_bucket(@bucket2, @bucket1)
        elsif empty?(@bucket2)
          pour_from_to_bucket(@bucket1, @bucket2)
        end
        @moves += 1
        p "move:#{@moves} con 4 bucket1: #{@bucket1[0]} bucket2: #{@bucket2[0]}"
      elsif full_and_non_empty_not_equal_to_another_bucket_max(@bucket1, @bucket2)
        if full?(@bucket1)
          empty(@bucket1)
        else
          empty(@bucket2)
        end
        @moves += 1
        p "move:#{@moves} con 5 bucket1: #{@bucket1[0]} bucket2: #{@bucket2[0]}"
      elsif full_and_non_empty_equal_to_another_bucket_max(@bucket1, @bucket2)
        if full?(@bucket1)
          pour_from_to_bucket(@bucket1, @bucket2)
        else
          pour_from_to_bucket(@bucket2, @bucket1)
        end
        @moves += 1
        p "move:#{@moves} con 6 bucket1: #{@bucket1[0]} bucket2: #{@bucket2[0]}"
      elsif non_empty_and_non_empty(@bucket1, @bucket2)
        if @bucket1[1] > @bucket2[1]
          pour_from_to_bucket(@bucket2, @bucket1)
        else
          pour_from_to_bucket(@bucket1, @bucket2)
        end
        @moves += 1
        p "move:#{@moves} con 7 bucket1: #{@bucket1[0]} bucket2: #{@bucket2[0]}"
      end
    end
  end

  def smaller_is_non_empty_and_bigger_is_full(bucket, another_bucket)
    if bucket[1] < another_bucket[1]
      non_empty?(bucket) && full?(another_bucket)
    elsif bucket[1] > another_bucket[1]
      non_empty?(another_bucket) && full?(bucket)
    end
  end

  def smaller_is_non_empty_and_bigger_is_empty(bucket, another_bucket)
    if bucket[1] < another_bucket[1]
      non_empty?(bucket) && empty?(another_bucket)
    elsif bucket[1] > another_bucket[1]
      non_empty?(another_bucket) && empty?(bucket)
    end
  end

  def full_and_empty(bucket, another_bucket)
    full?(bucket) && empty?(another_bucket) || full?(another_bucket) && empty?(bucket)
  end

  def empty_and_non_empty_equal_to_another_bucket_max(bucket, another_bucket)
    empty?(bucket) && non_empty?(another_bucket) && another_bucket[0] == bucket[1] || empty?(another_bucket) && non_empty?(bucket) && bucket[0] == another_bucket
  end

  def empty_and_non_empty_not_equal_to_another_bucket_max(bucket, another_bucket)
    empty?(bucket) && non_empty?(another_bucket) && another_bucket[0] != bucket[1] || empty?(another_bucket) && non_empty?(bucket) && bucket[0] != another_bucket[1]
  end

  def full_and_non_empty_not_equal_to_another_bucket_max(bucket, another_bucket)
    full?(bucket) && non_empty?(another_bucket) && another_bucket[0] != bucket[1] || full?(another_bucket) && non_empty?(bucket) && bucket[0] != another_bucket[1]
  end

  def full_and_non_empty_equal_to_another_bucket_max(bucket, another_bucket)
    full?(bucket) && non_empty?(another_bucket) && another_bucket[0] == bucket[1] || full?(another_bucket) && non_empty?(bucket) && bucket[0] == another_bucket[1]
  end
  def non_empty_and_non_empty(bucket, another_bucket)
    non_empty?(bucket) && non_empty?(another_bucket)
  end


  def full?(bucket)
    bucket[0] == bucket[1]
  end

  def empty?(bucket)
    bucket[0] == 0
  end

  def non_empty?(bucket)
    bucket[0] != 0 && bucket[0] != bucket[1]
  end

  def fill(bucket)
    bucket[0] = bucket[1]
  end

  def empty(bucket)
    bucket[0] = 0
  end

  def pour_from_to_bucket(bucket, another_bucket)
    another_bucket[0] += bucket[0]
    if another_bucket[0] > another_bucket[1]
      bucket[0] = another_bucket[0] - another_bucket[1]
      another_bucket[0] = another_bucket[1]
    else
      empty(bucket)
    end
  end

  def goal_bucket
    @bucket1[0] == @goal ? 'one' : 'two'
  end

  def other_bucket
    @bucket1[0] == @goal ? @bucket2[0] : @bucket1[0]
  end
end

subject = TwoBucket.new(7, 11, 2, 'one')
subject.moves
subject.goal_bucket
subject.other_bucket

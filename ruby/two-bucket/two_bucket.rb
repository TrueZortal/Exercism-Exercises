# frozen_string_literal: true

class TwoBucket
  attr_reader :moves

  def initialize(bucket_1, bucket_2, goal, starting_point)
    @bucket_1_max = bucket_1
    @bucket_2_max = bucket_2
    @goal = goal
    @starting_point = starting_point
    @moves = 1
    build_bucketrrays
    calculate
  end

  def goal_bucket
    @bucket1[0] == @goal ? 'one' : 'two'
  end

  def other_bucket
    @bucket1[0] == @goal ? @bucket2[0] : @bucket1[0]
  end

  private

  def build_bucketrrays
    case @starting_point
    when 'one'
      @bucket1 = [@bucket_1_max, @bucket_1_max, 'yes']
      @bucket2 = [0, @bucket_2_max, 'no']
    when 'two'
      @bucket1 = [0, @bucket_1_max, 'no']
      @bucket2 = [@bucket_2_max, @bucket_2_max, 'yes']
    end
  end

  def calculate
    until @bucket1[0] == @goal || @bucket2[0] == @goal
      if @bucket1[1] == @goal || @bucket2[1] == @goal
        fill(other)
      elsif empty?(starting) && non_empty?(other)
        fill(starting)
      elsif full?(other)
        empty(other)
      elsif non_empty?(starting) || full?(starting)
        pour_from_to_bucket(starting, other)
      end
      @moves += 1
    end
  end

  def starting
    @bucket1[2] == 'yes' ? @bucket1 : @bucket2
  end

  def other
    @bucket1[2] == 'yes' ? @bucket2 : @bucket1
  end

  def full?(bucket)
    bucket[0] == bucket[1]
  end

  def empty?(bucket)
    (bucket[0]).zero?
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
end

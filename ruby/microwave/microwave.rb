class Microwave
  def initialize(time)
    @time = time.digits.reverse
    @base_timer = [0, 0, 0, 0]
    @base_timer = @base_timer.drop(@time.join.length)
    @base_timer =  @base_timer.append(@time).flatten
    if @base_timer[2] > 5
      @base_timer[2] = (@base_timer.flatten[2] % 6)
      @base_timer[1] += 1
    end
  end

  def timer
    @base_timer.each_slice(2).map {|x| x.join}.join(':')
  end
end


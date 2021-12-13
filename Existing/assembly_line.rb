class AssemblyLine
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    if @speed <= 4
      @speed*221*1
    elsif @speed > 4 and @speed <= 8
      @speed*221*0.9
    elsif @speed == 9
      @speed*221*0.8
    else
      @speed*221*0.77
    end
  end

  def working_items_per_minute
    if @speed <= 4
      (@speed*221*1/60).floor
    elsif @speed > 4 and @speed <= 8
      (@speed*221*0.9/60).floor
    elsif @speed == 9
      (@speed*221*0.8/60).floor
    else
      (@speed*221*0.77/60).floor
    end
  end
end

AssemblyLine.new(6).production_rate_per_hour

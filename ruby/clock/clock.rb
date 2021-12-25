class Clock
  attr_reader :hour, :minute
  def initialize(hour: 00 , minute: 00)
    @hour = (((hour.to_i*60)+minute.to_i)/60).modulo(24)
    @minute = minute.modulo(60)
  end
  def +(additional)
    @hour = (((hour+additional.hour)*60+(minute+additional.minute))/60).modulo(24)
    @minute = (minute.to_i+additional.minute.to_i).modulo(60)
    self.to_s
  end
  def -(additional)
    @hour = (((hour-additional.hour)*60+(minute-additional.minute))/60).modulo(24)
    @minute = (minute.to_i-additional.minute.to_i).modulo(60)
    self.to_s
  end
  def ==(other)
    @hour == other.hour && @minute == other.minute
  end
  def to_s
    time = []
    @hour > 9 ? time << @hour : time << "0#{@hour}"
    time << ":"
    @minute > 9 ? time << @minute : time << "0#{@minute}"
    time.join
  end
end


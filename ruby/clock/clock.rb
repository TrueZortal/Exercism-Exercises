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




# if minute > 59
#   @hour = (hour.to_i+(minute/60).to_i).modulo(24)
#   @minute = minute.modulo(60)
# elsif minute <=59 && minute >= 0
# @minute = minute.modulo(60)
# @hour = hour.modulo(24)
# elsif minute < 0 && minute > -59
#   @hour = (((hour.to_i*60)+minute.to_i)/60).modulo(24)
#   @minute = minute.modulo(60)
# else
#   @hour = (hour.to_i+(minute/60).to_i).modulo(24)
#   @minute = minute.modulo(60)
# end

#@hour = ((((hour.to_i*60)+minute.to_i)/60)+(((additional.hour.to_i*60)+additional.minute.to_i)/60)).modulo(24)

# why do we need to implement the def == method to successfully assess?
class Gigasecond
  def self.from(given_time)
    @time = given_time
    time_as_seconds_since_Unix_epoch = Time.at(@time + 1000000000)
    time_as_seconds_since_Unix_epoch
  end
end


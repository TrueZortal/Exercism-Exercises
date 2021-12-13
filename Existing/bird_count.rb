class BirdCount
  def self.last_week
    BirdCount = [0, 2, 5, 3, 7, 8, 4]
  end

  def initialize(birds_per_day)
    raise 'Please implement the BirdCount#initialize method'
  end

  def yesterday
    BirdCount.last_week[-1]
  end

  def total
    BirdCount.last_week.sum
  end

  def busy_days
    BirdCount.last_week.count { |number| number >= 5}
  end

  def day_without_birds?
    BirdCount.last_week.any? { |number| number == 0}
  end
end

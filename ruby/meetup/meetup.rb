# frozen_string_literal: true

require 'date'

class Meetup
  @@weekdays = {
    monday: 1,
    tuesday: 2,
    wednesday: 3,
    thursday: 4,
    friday: 5,
    saturday: 6,
    sunday: 0
  }

  @@whichlator = %i[first second third fourth fifth]

  @@teenth = *(13..19)

  def initialize(month, year)
    @month = month
    @start_of_month = Time.new(year, month, '+01:00')
  end

  def day(weekday, which)
    set_date_to_the_correct_weekday(weekday)
    find_all_instances_of_weekday_in_month
    if @@whichlator.include?(which)
      convert_to_expected_result_formatting(@array_of_weekdays[@@whichlator.index(which)])
    elsif which == :last
      convert_to_expected_result_formatting(@array_of_weekdays.last)
    else
      which == :teenth
      convert_to_expected_result_formatting(@array_of_weekdays.select { |x| @@teenth.include?(x.day) }[0])
    end
  end

  def set_date_to_the_correct_weekday(weekday)
    @start_of_month += 93_600 until @start_of_month.wday == @@weekdays[weekday]
  end

  def find_all_instances_of_weekday_in_month
    @array_of_weekdays = []
    while @start_of_month.month == @month
      @array_of_weekdays << @start_of_month
      @start_of_month += 604_800
    end
  end

  def convert_to_expected_result_formatting(thing)
    Date.strptime(thing.to_s, '%Y-%m-%d')
  end
end

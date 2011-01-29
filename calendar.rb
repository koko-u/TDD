require 'date'

class Calendar
  attr_reader :first_day

  def initialize(year, month)
    @first_day = Date.new(year, month, 1)
  end

  def last_day
    (@first_day >> 1) - 1
  end

  def last_saturday
    lsaturday = last_day
    lsaturday += 1 until lsaturday.saturday?
    lsaturday
  end

  def each_week
    (last_day.day / 7 + 1)
  end
end

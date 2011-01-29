require 'date'

class Calendar
  attr_reader :first_day

  def initialize(year, month)
    @first_day = Date.new(year, month, 1)
  end

  def last_day
    (@first_day >> 1) - 1
  end

  def first_sunday
    ret = first_day
    ret -= 1 until ret.sunday?
    ret
  end

  def last_saturday
    lsaturday = last_day
    lsaturday += 1 until lsaturday.saturday?
    lsaturday
  end

  def each_week
    week = Array.new(7) { |i| first_sunday + i }
    until week[0] > last_saturday
      yield week
      week.map! { |i| i + 7 }
    end
    self
  end

  def each_day
    first_day.upto(last_day) do |date|
      yield date
    end
    self
  end

end

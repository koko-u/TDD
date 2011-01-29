require 'test/unit'
require 'date'
require './calendar'

class CalendarTest < Test::Unit::TestCase
  def test_jan_first_day
    jan = Calendar.new(2011, 1)
    assert_equal Date.new(2011, 1, 1), jan.first_day
  end

  def test_jan_last_day
    jan = Calendar.new(2011, 1)
    assert_equal Date.new(2011, 1, 31), jan.last_day
  end

  def test_feb_last_day
    feb = Calendar.new(2011, 2)
    assert_equal Date.new(2011, 2, 28), feb.last_day

    feb = Calendar.new(2012, 2)
    assert_equal Date.new(2012, 2, 29), feb.last_day
  end

  def test_first_sunday
    jan = Calendar.new(2011, 1)
    assert_equal Date.new(2010, 12, 26), jan.first_sunday
  end

  def test_last_saturday
    jan = Calendar.new(2011, 1)
    assert_equal Date.new(2011, 2, 5), jan.last_saturday
  end

  def test_each_week
    cal201101 = [
                 [26, 27, 28, 29, 30, 31,  1],
                 [ 2,  3,  4,  5,  6,  7,  8],
                 [ 9, 10, 11, 12, 13, 14, 15],
                 [16, 17, 18, 19, 20, 21, 22],
                 [23, 24, 25, 26, 27, 28, 29],
                 [30, 31,  1,  2,  3,  4,  5]
                ]
    jan = Calendar.new(2011, 1)
    result = []
    jan.each_week do |week|
      result << week.map { |date| date.day }
    end
    assert_equal cal201101, result
  end

  def test_each_week_return_self
    jan = Calendar.new(2011, 1)
    assert_equal jan, (jan.each_week { })
  end

  def test_each_day
    cal201101 = [
                                          1,
                  2,  3,  4,  5,  6,  7,  8,
                  9, 10, 11, 12, 13, 14, 15,
                 16, 17, 18, 19, 20, 21, 22,
                 23, 24, 25, 26, 27, 28, 29,
                 30, 31
                ]
    jan = Calendar.new(2011, 1)
    result = []
    jan.each_day do |date|
      result << date.day
    end
    assert_equal cal201101, result
  end

  def test_each_day_return_self
    jan = Calendar.new(2011, 1)
    assert_equal jan, (jan.each_day { })
  end
end

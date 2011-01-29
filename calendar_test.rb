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

  def test_last_saturday
    jan = Calendar.new(2011, 1)
    assert_equal Date.new(2011, 2, 5), jan.last_saturday
  end

  def test_each_week
    jan = Calendar.new(2011, 1)
    count = 0
    jan.each_week do
      count += 1
    end
    assert_equal 6, count

    apl = Calendar.new(2011, 4)
    count = 0
    apl.each_week do
      count += 1
    end
    assert_equal 5, count
  end

end

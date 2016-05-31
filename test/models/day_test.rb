require 'test_helper'

class DayTest < ActiveSupport::TestCase
  setup do
    @day = days(:day)
  end

  test 'valid' do
    assert @day.valid?
  end

  test 'number of days is positive' do
    @day.order_of_days = -1
    assert @day.invalid?

    @day.order_of_days = 0
    assert @day.invalid?
  end
end

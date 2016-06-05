# == Schema Information
#
# Table name: days
#
#  id         :integer          not null, primary key
#  position   :integer          not null
#  program_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class DayTest < ActiveSupport::TestCase
  setup do
    @day = days(:day)
  end

  test 'valid' do
    assert @day.valid?
  end

  test 'number of days is positive' do
    @day.position = -1
    assert @day.invalid?

    @day.position = 0
    assert @day.invalid?
  end
end

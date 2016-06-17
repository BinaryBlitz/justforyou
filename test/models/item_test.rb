# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  weight     :integer          not null
#  calories   :float            not null
#  starts_at  :time             not null
#  ends_at    :time             not null
#  day_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  setup do
    @item = items(:item)
  end

  test 'valid' do
    assert @item.valid?
  end

  test 'calories and weight are positive' do
    @item.calories = -1
    assert @item.invalid?

    @item.calories = 0
    assert @item.invalid?

    @item.weight = -1
    assert @item.invalid?

    @item.weight = 0
    assert @item.invalid?
  end
end

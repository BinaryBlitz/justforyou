# == Schema Information
#
# Table name: line_items
#
#  id             :integer          not null, primary key
#  order_id       :integer
#  program_id     :integer
#  number_of_days :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  setup do
    @line_item = line_items(:line_item)
  end

  test 'valid' do
    assert @line_item.valid?
  end

  test 'number of days is positive' do
    @line_item.number_of_days = -1
    assert @line_item.invalid?

    @line_item.number_of_days = 0
    assert @line_item.invalid?
  end
end

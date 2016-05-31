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

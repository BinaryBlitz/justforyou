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

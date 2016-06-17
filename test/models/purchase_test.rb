require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase
  setup do
    @purchase = purchases(:purchase)
  end

  test 'valid' do
    assert @purchase.valid?
  end
end

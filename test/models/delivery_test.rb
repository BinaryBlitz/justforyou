require 'test_helper'

class DeliveryTest < ActiveSupport::TestCase
  setup do
    @delivery = deliveries(:delivery)
  end

  test 'valid' do
    assert @delivery.valid?
  end
end

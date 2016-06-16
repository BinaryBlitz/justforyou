require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  setup do
    @payment = payments(:payment)
  end

  test 'valid' do
    assert @payment.valid?
  end
end

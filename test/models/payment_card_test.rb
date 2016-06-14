require 'test_helper'

class PaymentCardTest < ActiveSupport::TestCase
  setup do
    @payment_card = payment_cards(:payment_card)
  end

  test 'valid' do
    assert @payment_card.valid?
  end
end

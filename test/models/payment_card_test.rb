require 'test_helper'

class PaymentCardTest < ActiveSupport::TestCase
  setup do
    @payment_card = payment_cards(:payment_card)
  end

  test 'valid' do
    assert @payment_card.valid?
  end

  test 'name length' do
    @payment_card.name = 'n' * 91
    assert @payment_card.invalid?
  end

  test 'cvc length' do
    @payment_card.cvc = 1234
    assert @payment_card.invalid?
  end

  test 'number length' do
    @payment_card.number = 0
    assert @payment_card.invalid?
  end

  test 'validate month' do
    @payment_card.month = 0
    assert @payment_card.invalid?

    @payment_card.month = 13
    assert @payment_card.invalid?
  end

  test 'validate year' do
    @payment_card.year = 2015
    assert @payment_card.invalid?

    @payment_card.year = 2025
    assert @payment_card.invalid?
  end
end

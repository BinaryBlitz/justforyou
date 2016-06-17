# == Schema Information
#
# Table name: payments
#
#  id              :integer          not null, primary key
#  order_id        :integer
#  amount          :integer          not null
#  paid            :boolean          default(FALSE)
#  payment_card_id :integer
#  transaction_id  :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  setup do
    @payment = payments(:payment)
  end

  test 'valid' do
    assert @payment.valid?
  end
end

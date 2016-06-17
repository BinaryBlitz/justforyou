# == Schema Information
#
# Table name: payment_cards
#
#  id            :integer          not null, primary key
#  number        :string           not null
#  holder        :string           not null
#  rebill_anchor :string           not null
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class PaymentCardTest < ActiveSupport::TestCase
  setup do
    @payment_card = payment_cards(:payment_card)
  end

  test 'valid' do
    assert @payment_card.valid?
  end
end

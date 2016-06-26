# == Schema Information
#
# Table name: purchases
#
#  id               :integer          not null, primary key
#  number_of_days   :integer          not null
#  program_id       :integer
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  deliveries_count :integer          default(0)
#

require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase
  setup do
    @purchase = purchases(:purchase)
  end

  test 'valid' do
    assert @purchase.valid?
  end

  test 'visible scope' do
    @purchase.update(deliveries_count: @purchase.number_of_days)

    refute_includes Purchase.visible, @purchase
  end
end

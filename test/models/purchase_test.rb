# == Schema Information
#
# Table name: purchases
#
#  id             :integer          not null, primary key
#  number_of_days :integer          not null
#  program_id     :integer
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase
  setup do
    @purchase = purchases(:purchase)
  end

  test 'valid' do
    assert @purchase.valid?
  end
end

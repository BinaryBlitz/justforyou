# == Schema Information
#
# Table name: deliveries
#
#  id            :integer          not null, primary key
#  status        :integer          default("pending")
#  scheduled_for :datetime         not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  address_id    :integer
#  purchase_id   :integer
#  comment       :text
#  paid          :boolean          default(FALSE)
#

require 'test_helper'

class DeliveryTest < ActiveSupport::TestCase
  setup do
    @delivery = deliveries(:delivery)
    @purchase = @delivery.purchase
  end

  test 'valid' do
    assert @delivery.valid?
  end

  test 'increases counter cache' do
    @delivery.save

    assert_difference -> { @purchase.reload.deliveries_count }, -1 do
      @delivery.destroy
    end
  end
end

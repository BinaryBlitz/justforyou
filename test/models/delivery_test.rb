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
#

require 'test_helper'

class DeliveryTest < ActiveSupport::TestCase
  setup do
    @delivery = deliveries(:delivery)
  end

  test 'valid' do
    assert @delivery.valid?
  end
end

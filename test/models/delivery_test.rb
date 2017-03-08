# == Schema Information
#
# Table name: deliveries
#
#  id                  :integer          not null, primary key
#  status              :integer          default("pending")
#  scheduled_for       :datetime         not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  address_id          :integer
#  purchase_id         :integer
#  comment             :text
#  paid                :boolean          default(FALSE)
#  delivery_invoice_id :integer
#

require 'test_helper'

class DeliveryTest < ActiveSupport::TestCase
  setup do
    @delivery = deliveries(:delivery)
    @purchase = @delivery.purchase

    @new_delivery = @delivery.dup
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

  test 'cannot be canceled if scheduled for yesterday' do
    @new_delivery.scheduled_for = 1.day.ago
    assert @new_delivery.invalid?
  end

  test 'cannot be canceled if scheduled for today' do
    @new_delivery.scheduled_for = Time.zone.now
    assert @new_delivery.invalid?
  end

  test 'can be canceled if scheduled for more than two days from now' do
    @new_delivery.scheduled_for = 2.days.from_now
    assert @new_delivery.valid?
  end

  test 'can be canceled before 11:00 of the previous day' do
    @new_delivery.scheduled_for = 1.day.from_now

    travel_to Time.zone.parse('10:00') do
      assert @new_delivery.valid?
    end
  end

  test 'cannot be canceled after 11:00 of the previous day' do
    @new_delivery.scheduled_for = 1.day.from_now

    travel_to Time.zone.parse('12:00') do
      assert @new_delivery.invalid?
    end
  end
end

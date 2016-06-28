# == Schema Information
#
# Table name: delivery_invoices
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  paid       :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class DeliveryInvoiceTest < ActiveSupport::TestCase
  setup do
    @delivery_invoice = delivery_invoices(:delivery_invoice)
    @delivery = deliveries(:delivery)
  end

  test 'valid' do
    @delivery.update(paid: false)
    assert @delivery_invoice.valid?
  end
end

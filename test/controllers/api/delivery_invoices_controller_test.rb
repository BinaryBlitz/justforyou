require 'test_helper'

class API::DeliveryInvoicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @delivery_invoice = delivery_invoices(:delivery_invoice)
  end

  test 'should create' do
    new_delivery = deliveries(:new_delivery)
    new_delivery.update(paid: false)

    assert_difference 'DeliveryInvoice.count' do
      post api_delivery_invoices_path(api_token: api_token)
    end

    assert_response :created
  end
end

require 'test_helper'

class API::DeliveriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @delivery = deliveries(:delivery)
    @new_delivery = deliveries(:new_delivery)
  end

  test 'should not cancel delivery' do
    patch cancel_api_delivery_path(@delivery, api_token: api_token), params: { delivery: { status: 'canceled' } }
    assert_response :forbidden
  end

  test 'should cancel delivery' do
    patch cancel_api_delivery_path(@new_delivery, api_token: api_token), params: { delivery: { status: 'canceled' } }
    assert_response :ok
  end
end

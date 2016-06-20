require 'test_helper'

class API::DeliveriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @delivery = deliveries(:delivery)
    @new_delivery = deliveries(:new_delivery)
    @purchase = @delivery.purchase
  end

  test 'should get index' do
    get api_deliveries_path(api_token: api_token)
    assert_response :success
  end

  test 'should create delivery' do
    @delivery.destroy

    assert_difference 'Delivery.count' do
      post api_purchase_deliveries_url(@purchase, api_token: api_token), params: {
        deliveries: [@delivery.attributes]
      }
    end

    assert_response :created
  end

  test 'should not cancel delivery' do
    patch cancel_api_delivery_path(@delivery, api_token: api_token), params: {
      delivery: { status: 'canceled' }
    }
    assert_response :forbidden
  end

  test 'should cancel delivery' do
    patch cancel_api_delivery_path(@new_delivery, api_token: api_token), params: {
      delivery: { status: 'canceled' }
    }
    assert_response :ok
  end
end

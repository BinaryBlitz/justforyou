require 'test_helper'

class API::OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:order)
  end

  test 'should get index' do
    get api_orders_path(api_token: api_token)
    assert_response :success
  end

  test 'should create order' do
    @order.destroy

    assert_difference 'Order.count' do
      post api_orders_url(@order, api_token: api_token), params: { order: @order.attributes }
    end

    assert_response :created
  end

  test 'should update order' do
    new_comment = 'Another comment'
    patch api_order_path(@order, api_token: api_token), params: { order: { comment: new_comment } }
    assert_response :ok
    assert_equal new_comment, @order.reload.comment
  end

  test 'should destroy order' do
    assert_difference 'Order.count', -1 do
      delete api_order_url(@order, api_token: api_token)
    end

    assert_response :no_content
  end
end

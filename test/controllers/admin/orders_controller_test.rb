require 'test_helper'

class Admin::OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:order)
    sign_in_admin
  end

  test 'should get index' do
    get admin_orders_path
    assert_response :success
  end

  test 'should get index with 0 orders' do
    Order.destroy_all

    get admin_orders_path
    assert_response :success
  end

  test 'should get show' do
    get admin_order_path(@order)
    assert_response :success
  end
end

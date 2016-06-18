require 'test_helper'

class Admin::OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:order)
    sign_in_admin
  end

  test 'should get show' do
    get admin_order_path(@order)
    assert_response :success
  end
end

require 'test_helper'

class API::PurchasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purchase = purchases(:purchase)
  end

  test 'should get index' do
    get api_purchases_path(api_token: api_token)
    assert_response :success
  end
end

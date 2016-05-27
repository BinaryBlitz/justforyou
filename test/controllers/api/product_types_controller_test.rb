require 'test_helper'

class API::ProductTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_type = product_types(:product_type)
  end

  test "should get index" do
    get api_product_types_path(api_token: api_token)
    assert_response :success
  end
end

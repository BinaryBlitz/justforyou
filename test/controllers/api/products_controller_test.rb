require 'test_helper'

class API::ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:product)
    @product_type = @product.product_type
  end

  test "should get index" do
    get api_product_type_products_path(api_token: api_token,
                                       product_type_id: @product_type.id)
    assert_response :success
  end

  test 'should get show' do
    get api_product_path(@product, api_token: api_token)
    assert_response :success
  end
end

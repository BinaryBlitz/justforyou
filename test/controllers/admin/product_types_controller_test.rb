require 'test_helper'

class Admin::ProductTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_type = product_types(:product_type)
    sign_in_admin
  end

  test 'should get index' do
    get admin_product_types_path
    assert_response :success
  end

  test 'should create product type' do
    @product_type.destroy

    assert_difference 'ProductType.count' do
      post admin_product_types_url(@product_type), params: {
        product_type: @product_type.attributes
      }
    end

    assert_redirected_to admin_product_types_path
  end

  test 'should update product type' do
    new_name = 'New name'
    patch admin_product_type_path(@product_type), params: { product_type: { name: new_name } }
    assert_redirected_to admin_product_types_path
    assert_equal new_name, @product_type.reload.name
  end

  test 'should destroy product type' do
    assert_difference 'ProductType.count', -1 do
      delete admin_product_type_url(@product_type)
    end

    assert_redirected_to admin_product_types_path
  end
end

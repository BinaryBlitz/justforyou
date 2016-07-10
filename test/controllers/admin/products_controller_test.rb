require 'test_helper'

class Admin::ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:product)
    @product_type = @product.product_type
    sign_in_admin
  end

  test 'should get index' do
    get admin_product_type_products_path(@product_type)
    assert_response :success
  end

  test 'should create product' do
    assert_difference 'Product.count' do
      post admin_product_type_products_url(@product_type), params: { product: @product.attributes }
    end

    assert_redirected_to admin_product_type_products_path(@product_type)
  end

  test 'should update product' do
    new_name = 'New name'
    patch admin_product_path(@product), params: { product: { name: new_name } }
    assert_redirected_to admin_product_type_products_path(@product_type)
    assert_equal new_name, @product.reload.name
  end

  test 'should destroy product' do
    assert_difference 'Product.count', -1 do
      delete admin_product_url(@product)
    end

    assert_redirected_to admin_product_type_products_path(@product_type)
  end
end

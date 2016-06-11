require 'test_helper'

class Admin::PromotionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @promotion = promotions(:promotion)
    sign_in_admin
  end

  test 'should get index' do
    get admin_promotions_path
    assert_response :success
  end

  test 'should get show' do
    get admin_promotion_path(@promotion)
    assert_response :success
  end

  test 'should create promotion' do
    @promotion.destroy

    assert_difference 'Promotion.count' do
      post admin_promotions_url(@promotion, api_token: api_token), params: {
        promotion: @promotion.attributes
      }
    end

  end

  test 'should update promotion' do
    new_name = 'Another name'
    patch admin_promotion_path(@promotion), params: { promotion: { name: new_name } }
    assert_redirected_to admin_promotions_path
    assert_equal new_name, @promotion.reload.name
  end

  test 'should destroy promotion' do
    assert_difference 'Promotion.count', -1 do
      delete admin_promotion_url(@promotion)
    end

    assert_redirected_to admin_promotions_path
  end
end

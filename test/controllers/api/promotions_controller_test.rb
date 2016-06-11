require 'test_helper'

class API::PromotionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @promotion = promotions(:promotion)
  end

  test 'should get index' do
    get api_promotions_path(api_token: api_token)
    assert_response :success
  end

  test 'should get show' do
    get api_promotion_path(@promotion, api_token: api_token)
    assert_response :success
  end
end

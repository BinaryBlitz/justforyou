require 'test_helper'

class API::ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:item)
    @day = @item.day
  end

  test 'should get index' do
    get api_day_items_path(@day, api_token: api_token)
    assert_response :success
  end
end

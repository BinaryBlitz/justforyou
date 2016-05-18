require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:valid_one)
  end

  test "should get index" do
    get api_users_path
    assert_response :success
  end

  test "should get show" do
    get api_users_path, params: { id: @user.id }
    assert_response :success
  end
end

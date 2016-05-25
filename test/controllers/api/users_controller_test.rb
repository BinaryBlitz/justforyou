require 'test_helper'

class API::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:foo)
  end

  test 'should get index' do
    get api_users_path(api_token: api_token)
    assert_response :success
  end

  test 'should get show' do
    get api_users_path(@user, api_token: api_token)
    assert_response :success
  end

  test 'should update user' do
    new_name = 'Another name'
    patch api_user_path(@user, api_token: api_token), params: { user: { first_name: new_name } }
    assert_response :ok
    assert_equal new_name, @user.reload.first_name
  end
end

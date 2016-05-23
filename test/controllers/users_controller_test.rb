require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:foo)
  end

  test 'should get index' do
    get api_users_path
    assert_response :success
  end

  test 'should get show' do
    get api_users_path(@user)
    assert_response :success
  end

  test 'should update user' do
    new_name = 'Another name'
    patch api_user_path(@user), params: { user: { first_name: new_name } }
    assert_response :ok
    assert new_name, @user.reload.first_name
  end

  test 'should destroy user' do
    assert_difference 'User.count', -1 do
      delete api_user_url(@user)
    end

    assert_response :no_content
  end
end

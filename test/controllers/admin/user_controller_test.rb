require 'test_helper'

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:foo)
    sign_in_admin
  end

  test 'should get index' do
    get admin_users_path
    assert_response :success
  end

  test 'should get show' do
    get admin_users_path(@user)
    assert_response :success
  end

  test 'should update user' do
    new_name = 'Another name'
    patch admin_user_path(@user), params: { user: { first_name: new_name } }
    assert_redirected_to admin_users_path
    assert_equal new_name, @user.reload.first_name
  end

  test 'should destroy user' do
    assert_difference 'User.count', -1 do
      delete admin_user_url(@user)
    end

    assert_redirected_to admin_users_path
  end
end

require 'test_helper'

class Admin::ExportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in_admin
  end

  test 'should get kitchen exports' do
    get kitchen_admin_exports_path
    assert_response :success
  end

  test 'should get courier exports' do
    get courier_admin_exports_path
    assert_response :success
  end

  test 'should get manager exports' do
    get manager_admin_exports_path
    assert_response :success
  end
end

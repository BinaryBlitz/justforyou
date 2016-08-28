require 'test_helper'

class Admin::ExportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in_admin
  end

  test 'should create kitchen exports' do
    post admin_exports_path(commit: 'Для кухни')
    assert_response :success
  end

  test 'should create courier exports' do
    post admin_exports_path(commit: 'Для курьеров')
    assert_response :success
  end

  test 'should create manager exports' do
    post admin_exports_path(commit: 'Для менеджеров')
    assert_response :success
  end
end

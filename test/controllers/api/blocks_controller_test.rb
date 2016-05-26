require 'test_helper'

class API::BlocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @block = blocks(:block)
  end

  test 'should get index' do
    get api_blocks_path
    assert_response :success
  end

  test 'should get show' do
    get api_blocks_path(@block)
    assert_response :success
  end
end

require 'test_helper'

class API::BlocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @block = blocks(:block)
  end

  test 'should get index' do
    get api_blocks_path(api_token: api_token)
    assert_response :success
  end

  test 'should get show' do
    get api_block_path(@block, api_token: api_token)
    assert_response :success
  end
end

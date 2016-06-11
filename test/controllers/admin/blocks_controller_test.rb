require 'test_helper'

class Admin::BlocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @block = blocks(:block)
    sign_in_admin
  end

  test 'should get index' do
    get admin_blocks_path
    assert_response :success
  end

  test 'should get show' do
    get admin_block_path(@block)
    assert_response :success
  end

  test 'should create block' do
    @block.destroy

    assert_difference 'Block.count' do
      post admin_blocks_url(@block), params: {
        block: @block.attributes.merge(image: fixture_file_upload('public/blank.jpg'))
      }
    end
  end

  test 'should update block' do
    new_name = 'Another name'
    patch admin_block_path(@block), params: { block: { name: new_name } }
    assert_redirected_to admin_blocks_path
    assert_equal new_name, @block.reload.name
  end

  test 'should destroy block' do
    assert_difference 'Block.count', -1 do
      delete admin_block_url(@block)
    end

    assert_redirected_to admin_blocks_path
  end
end

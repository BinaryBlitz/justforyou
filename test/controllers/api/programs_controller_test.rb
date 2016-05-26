require 'test_helper'

class API::ProgramsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @program = programs(:program)
    @block = @program.block
  end

  test 'should get index' do
    get api_block_programs_path(api_token: api_token, block_id: @block.id)
    assert_response :success
  end

  test 'should get show' do
    get api_block_program_path(@program, api_token: api_token, block_id: @block.id)
    assert_response :success
  end

  test 'should update program' do
    patch api_block_program_path(@program, api_token: api_token, block_id: @block.id),
                                           params: { program: { primary_price: 1 } }
    assert_response :ok
    assert_equal 1, @program.reload.primary_price
  end
end

require 'test_helper'

class API::ProgramsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @program = programs(:program)
  end

  test 'should get index' do
    get api_programs_path(api_token: api_token)
    assert_response :success
  end

  test 'should get show' do
    get api_program_path(@program, api_token: api_token)
    assert_response :success
  end

  test 'should update program' do
    patch api_program_path(@program, api_token: api_token), params: { program: { primary_price: 1 } }
    assert_response :ok
    assert_equal 1, @program.reload.primary_price
  end
end

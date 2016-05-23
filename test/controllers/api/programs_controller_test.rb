require 'test_helper'

class ProgramsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @program = programs(:program)
  end

  test 'should get index' do
    get api_programs_path
    assert_response :success
  end

  test 'should get show' do
    get api_programs_path(@program)
    assert_response :success
  end

  test 'should update program' do
    patch api_program_path(@program), params: { program: { primary_price: 1 } }
    assert_response :ok
    assert @program.reload.primary_price = 1
  end

  test 'should destroy program' do
    assert_difference 'Program.count', -1 do
      delete api_program_url(@program)
    end

    assert_response :no_content
  end
end

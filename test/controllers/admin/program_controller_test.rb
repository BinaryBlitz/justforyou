require 'test_helper'

class Admin::ProgramsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @program = programs(:program)
    sign_in_admin
  end

  test 'should get index' do
    get admin_programs_path
    assert_response :success
  end

  test 'should get show' do
    get admin_program_path(@program)
    assert_response :success
  end

  test 'should create program' do
    @program.destroy

    assert_difference 'Program.count' do
      post admin_programs_url(@program), params: {
        program: {
          name: @program.name,
          description: @program.description,
          prescription: @program.prescription,
          threshold: @program.threshold,
          primary_price: @program.primary_price,
          secondary_price: @program.secondary_price,
          block_id: @program.block_id
        }.merge(preview_image: fixture_file_upload('public/blank.jpg'))
      }
    end

    assert_redirected_to admin_programs_path
  end

  test 'should update program' do
    patch admin_program_path(@program), params: { program: { primary_price: 1 } }
    assert_redirected_to admin_programs_path
    assert_equal 1, @program.reload.primary_price
  end

  test 'should destroy program' do
    assert_difference 'Program.count', -1 do
      delete admin_program_url(@program)
    end

    assert_redirected_to admin_programs_path
  end
end

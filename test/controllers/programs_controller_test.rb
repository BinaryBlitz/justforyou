require 'test_helper'

class ProgramsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @program = programs(:program)
  end

  test "should get index" do
    get api_programs_path
    assert_response :success
  end

  test "should get show" do
    get api_programs_path(@program)
    assert_response :success
  end
end

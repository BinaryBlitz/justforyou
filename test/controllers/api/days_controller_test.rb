require 'test_helper'

class API::DaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @day = days(:day)
    @program = @day.program
  end

  test 'should get index' do
    get api_program_days_path(@program, api_token: api_token)
    assert_response :success
  end
end

require 'test_helper'

class API::DaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @day = days(:day)
    @program = @day.program
  end

  test 'should get show' do
    get api_program_day_path(@program, @day, api_token: api_token)
    assert_response :success
  end
end

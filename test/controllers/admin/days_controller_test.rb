require 'test_helper'

class Admin::DaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @day = days(:day)
    @program = programs(:program)
    sign_in_admin
  end

  test 'should create day' do
    assert_difference 'Day.count' do
      post admin_program_days_path(@program), params: { day: @day.attributes }
    end

    assert_redirected_to admin_day_url(Day.last)
  end
end

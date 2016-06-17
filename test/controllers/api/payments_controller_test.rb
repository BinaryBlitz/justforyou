require 'test_helper'

class API::PaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment = payments(:payment)
  end

  test 'should get index' do
    get api_payments_url(api_token: api_token)
    assert_response :success
  end
end

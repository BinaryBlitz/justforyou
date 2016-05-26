require 'test_helper'

class API::AddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @address = addresses(:address)
  end

  test 'should get index' do
    get api_addresses_path(api_token: api_token)
    assert_response :success
  end

  test 'should get show' do
    get api_address_path(@address, api_token: api_token)
    assert_response :success
  end

  test 'should create address' do
    @address.destroy

    assert_difference 'Address.count' do
      post api_addresses_url(@address, api_token: api_token), params: {
        address: @address.attributes
      }
    end

    assert_response :created
  end
end
require 'test_helper'

class API::AddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @address = addresses(:address)
    @address_two = addresses(:address_two)
    @delivery = deliveries(:delivery)
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

  test 'should not destroy address' do
    assert_difference 'Address.count', 0 do
      delete api_address_url(@address, api_token: api_token)
    end

    assert_response :no_content
    assert_equal false, @address.reload.active
  end

  test 'should destroy address' do
    assert_difference 'Address.count', -1 do
      delete api_address_url(@address_two, api_token: api_token)
    end

    assert_response :no_content
  end
end

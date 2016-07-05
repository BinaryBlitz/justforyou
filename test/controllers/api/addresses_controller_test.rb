require 'test_helper'

class API::AddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @address = addresses(:address)
    @new_address = addresses(:new_address)
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

  test 'should destroy address' do
    assert_difference 'Address.count', -1 do
      delete api_address_url(@new_address, api_token: api_token)
    end

    assert_response :no_content
  end

  test 'should not destroy address with deliveries' do
    assert_difference 'Address.unscoped.count', 0 do
      delete api_address_url(@address, api_token: api_token)
      assert_in_delta Time.zone.now, @address.reload.deleted_at, 1
    end

    assert_response :no_content
  end
end

require 'test_helper'

class API::ExchangesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exchange = exchanges(:exchange)
    @purchase = @exchange.purchase
  end

  test 'should create exchange' do
    @exchange.destroy

    assert_difference 'Exchange.count' do
      post api_purchase_exchanges_url(@purchase, @exchange, api_token: api_token), params: {
        exchange: @exchange.attributes
      }
    end

    assert_response :created
  end
end

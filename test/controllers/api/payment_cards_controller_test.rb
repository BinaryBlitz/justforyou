require 'test_helper'

class API::PaymentCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment_card = payment_cards(:payment_card)
  end

  test 'should get index' do
    get api_payment_cards_path(api_token: api_token)
    assert_response :success
  end

  test 'should create payment card' do
    @payment_card.destroy

    assert_difference 'PaymentCard.count' do
      post api_payment_cards_url(@payment_card, api_token: api_token), params: {
        payment_card: @payment_card.attributes
      }
    end

    assert_response :created
  end

  test 'should destroy payment card' do
    assert_difference 'PaymentCard.count', -1 do
      delete api_payment_card_url(@payment_card, api_token: api_token)
    end

    assert_response :no_content
  end
end

require 'test_helper'

class API::SubstitutionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @substitution = substitutions(:substitution)
    @product = @substitution.product
  end

  test 'should get index' do
    get api_substitutions_path(api_token: api_token)
    assert_response :success
  end

  test 'should create substitution' do
    @substitution.destroy

    assert_difference 'Substitution.count' do
      post api_product_substitutions_url(@product, @substitution, api_token: api_token), params: {
        substitution: @substitution.attributes
      }
    end

    assert_response :created
  end

  test 'should destroy substitution' do
    assert_difference 'Substitution.count', -1 do
      delete api_substitution_url(@substitution, api_token: api_token)
    end

    assert_response :no_content
  end
end

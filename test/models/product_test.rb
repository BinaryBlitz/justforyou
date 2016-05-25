require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  setup do
    @product = products(:product)
  end

  test 'valid' do
    assert @product.valid?
  end
end

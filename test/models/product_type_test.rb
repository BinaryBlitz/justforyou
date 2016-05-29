require 'test_helper'

class ProductTypeTest < ActiveSupport::TestCase
  setup do
    @product_type = product_types(:product_type)
  end

  test 'valid' do
    assert @product_type.valid?
  end
end

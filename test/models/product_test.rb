# == Schema Information
#
# Table name: products
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  product_type_id :integer
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  setup do
    @product = products(:product)
  end

  test 'valid' do
    assert @product.valid?
  end
end

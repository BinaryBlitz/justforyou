# == Schema Information
#
# Table name: product_types
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ProductTypeTest < ActiveSupport::TestCase
  setup do
    @product_type = product_types(:product_type)
  end

  test 'valid' do
    assert @product_type.valid?
  end
end

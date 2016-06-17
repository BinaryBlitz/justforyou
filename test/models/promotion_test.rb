# == Schema Information
#
# Table name: promotions
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class PromotionTest < ActiveSupport::TestCase
  setup do
    @promotion = promotions(:promotion)
  end

  test 'valid' do
    assert @promotion.valid?
  end
end

# == Schema Information
#
# Table name: substitutions
#
#  id         :integer          not null, primary key
#  product_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SubstitutionTest < ActiveSupport::TestCase
  setup do
    @substitution = substitutions(:substitution)
  end

  test 'valid' do
    assert @substitution.valid?
  end
end

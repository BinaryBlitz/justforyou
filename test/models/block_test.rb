# == Schema Information
#
# Table name: blocks
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  image      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class BlockTest < ActiveSupport::TestCase
  setup do
    @block = blocks(:block)
  end

  test 'valid' do
    assert @block.valid?
  end
end

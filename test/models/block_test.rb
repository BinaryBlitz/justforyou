# == Schema Information
#
# Table name: blocks
#
#  id             :integer          not null, primary key
#  name           :string           not null
#  image          :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  programs_count :integer          default(0)
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

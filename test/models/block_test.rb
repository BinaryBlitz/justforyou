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
#  color          :string
#

require 'test_helper'

class BlockTest < ActiveSupport::TestCase
  setup do
    @block = blocks(:block)
  end

  test 'valid' do
    assert @block.valid?
  end

  test 'color is valid' do
    @block.color = '#11aa22'
    assert @block.valid?
  end

  test 'color is invalid' do
    @block.color = 'aaazzz'
    assert @block.invalid?
  end

  test 'color is downcased' do
    @block.color = '#FFF'
    @block.save

    assert @block.valid?
    assert_equal '#fff', @block.color
  end

  test 'color is unique' do
    block = @block.dup
    assert block.invalid?
  end
end

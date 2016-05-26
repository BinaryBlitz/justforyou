require 'test_helper'

class BlockTest < ActiveSupport::TestCase
  setup do
    @block = blocks(:block)
  end

  test 'valid' do
    assert @block.valid?
  end
end

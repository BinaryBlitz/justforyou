require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  setup do
    @admin = users(:valid_one)
  end

  test 'valid' do
    assert @admin.valid?
  end

end

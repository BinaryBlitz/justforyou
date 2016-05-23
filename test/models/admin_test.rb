require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  setup do
    @admin = admins(:admin)
  end

  test 'valid' do
    assert @admin.valid?
  end
end

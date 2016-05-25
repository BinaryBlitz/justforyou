require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  setup do
    @address = addresses(:address)
  end

  test 'valid' do
    assert @address.valid?
  end
end

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:foo)
  end

  test 'valid' do
    assert @user.valid?
  end

  test 'invalid without first name' do
    @user.first_name = nil
    assert @user.invalid?
  end

  test 'invalid without last name' do
    @user.last_name = nil
    assert @user.invalid?
  end

  test 'invalid phone number' do
    @user.phone_number = '1234567890'
    assert @user.invalid?
  end
end

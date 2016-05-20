require 'test_helper'

class ProgramTest < ActiveSupport::TestCase
  setup do
    @program = programs(:program)
  end

  test 'valid' do
    assert @program.valid?
  end

  test 'positive duration and price' do
    @program.duration = 0
    assert @program.invalid?

    @program.duration = 1
    assert @program.valid?

    @program.first_price = -1
    @program.second_price = -1
    assert @program.invalid?

    @program.first_price = 0
    @program.second_price = 0
    assert @program.valid?

    @program.first_price = 1
    @program.second_price = 1
    assert @program.valid?
  end

end

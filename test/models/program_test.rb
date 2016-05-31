# == Schema Information
#
# Table name: programs
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  description     :text             not null
#  duration        :integer          not null
#  primary_price   :integer          not null
#  secondary_price :integer          not null
#  preview_image   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  block_id        :integer
#

require 'test_helper'

class ProgramTest < ActiveSupport::TestCase
  setup do
    @program = programs(:program)
  end

  test 'valid' do
    assert @program.valid?
  end

  test 'name length' do
    @program.name = 'n' * 21
    assert @program.invalid?
  end

  test 'positive duration and price' do
    @program.duration = 0
    assert @program.invalid?

    @program.duration = 1
    assert @program.valid?

    @program.primary_price = -1
    @program.secondary_price = -1
    assert @program.invalid?

    @program.primary_price = 0
    @program.secondary_price = 0
    assert @program.invalid?

    @program.primary_price = 1
    @program.secondary_price = 1
    assert @program.valid?
  end
end

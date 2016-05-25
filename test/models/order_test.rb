# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  phone_number :string           not null
#  comment      :text
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  setup do
    @order = orders(:order)
  end

  test 'valid' do
    assert @order.valid?
  end

  test 'comment length' do
    @order.comment = 'c' * 1001
    assert @order.invalid?
  end

  test 'phone presence' do
    @order.phone_number = nil
    assert @order.invalid?
  end
end

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

  test 'invalid without line items' do
    @order.line_items.destroy_all
    assert @order.invalid?
  end

  test 'pending_balance is positive' do
    @order.pending_balance = -1
    assert @order.invalid?

    @order.pending_balance = 0
    assert @order.valid?
  end

  test 'order percentage' do
    assert_equal 0.05, @order.user.discount
  end

  test 'order total_price' do
    assert_equal 6200, @order.total_price
  end

  test 'order balance' do
    @order.set_pending_balance
    assert_equal 310, @order.pending_balance
  end

  test 'user balance' do
    @order.set_pending_balance
    @order.paid!
    assert_equal 310, @order.user.balance
  end
end

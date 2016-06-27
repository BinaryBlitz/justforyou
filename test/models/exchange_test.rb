# == Schema Information
#
# Table name: exchanges
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  purchase_id     :integer
#  program_id      :integer
#  paid            :boolean          default(FALSE)
#  pending_balance :integer          default(0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class ExchangeTest < ActiveSupport::TestCase
  setup do
    @exchange = exchanges(:exchange)
  end

  test 'valid' do
    assert @exchange.valid?
  end

  test 'paid' do
    @exchange.paid!
    assert @exchange.paid?
  end
end

# == Schema Information
#
# Table name: payments
#
#  id              :integer          not null, primary key
#  order_id        :integer
#  amount          :integer          not null
#  paid            :boolean          default(FALSE)
#  payment_card_id :integer
#  transaction_id  :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Payment < ApplicationRecord
  CURRENCY = 'RUB'

  before_validation :set_amount
  after_create :pay, if: :payment_card

  belongs_to :order
  belongs_to :payment_card, optional: true

  validates :amount, numericality: { greater_than: 0 }

  def payment_url
    return if payment_card
    Payonline::PaymentGateway.new(payment_options).payment_url
  end

  private

  def set_amount
    self.amount = order.total_price
  end

  def pay
    logger.debug("Payment #{id}: refill")

    # TODO: Make request
    Payonline::RebillGateway.new(rebill_options).payment_url
  end

  def payment_options
    {
      order_id: order_id,
      amount: amount,
      currency: CURRENCY
    }
  end

  def rebill_options
    payment_options.merge(payment_card.rebill_anchor)
  end
end

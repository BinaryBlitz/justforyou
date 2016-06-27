# == Schema Information
#
# Table name: payments
#
#  id              :integer          not null, primary key
#  amount          :integer          not null
#  paid            :boolean          default(FALSE)
#  payment_card_id :integer
#  transaction_id  :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  payable_type    :string
#  payable_id      :integer
#

class Payment < ApplicationRecord
  CURRENCY = 'RUB'

  before_validation :set_amount
  after_create :rebill, if: :payment_card

  belongs_to :payable, polymorphic: true
  belongs_to :payment_card, optional: true

  validates :amount, numericality: { greater_than: 0 }

  delegate :user, to: :order

  scope :paid, -> { where(paid: true) }

  def payment_url
    return if payment_card
    Payonline::PaymentGateway.new(payment_options).payment_url
  end

  def paid!(payment_card_params = {})
    logger.debug("Payment #{id}: paid")

    ActiveRecord::Base.transaction do
      update(paid: true)
      order.paid!
      user.payment_cards.create(payment_card_params) if payment_card_params.present?
    end
  end

  private

  def set_amount
    self.amount = payable.total_price
  end

  def rebill
    logger.debug("Payment #{id}: rebill")

    return false unless Payonline::RebillGateway.new(rebill_options).rebill
    paid!
  end

  def payment_options
    {
      order_id: id,
      amount: amount,
      currency: CURRENCY
    }
  end

  def rebill_options
    payment_options.merge(rebill_anchor: payment_card.rebill_anchor)
  end
end

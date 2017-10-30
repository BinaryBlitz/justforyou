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
  OPERATION_TYPE = 'Benefit'
  PAYMENT_SYSTEM_TYPE = 'card'

  before_validation :set_amount
  after_commit :rebill, on: :create, if: :payment_card

  belongs_to :payable, polymorphic: true
  belongs_to :payment_card, optional: true

  validates :amount, numericality: { greater_than: 0 }

  delegate :user, to: :payable

  scope :paid, -> { where(paid: true) }

  def payment_url
    return if payment_card
    Payonline::PaymentGateway.new(payment_options).payment_url
  end

  def paid!(payment_card_params = nil)
    return if paid?

    logger.debug("Payment #{id}: paid")

    ActiveRecord::Base.transaction do
      update_column(:paid, true)
      payable.paid!
    end

    create_payment_card(payment_card_params)
    fiscalize
  end

  private

  def set_amount
    self.amount = payable.total_price
  end

  def fiscalize
    return unless payable_type == 'Order'
    logger.debug("Payment #{id}: fisacalize")

    return false unless PayOnline::FiscalGateway.new(fiscal_options).fiscalization
  end

  def rebill
    logger.debug("Payment #{id}: rebill")

    return false unless Payonline::RebillGateway.new(rebill_options).rebill
    # Success callback may have already been called by PayOnline
    reload
    paid!
  end

  def payment_options
    {
      order_id: id,
      amount: amount,
      currency: CURRENCY
    }
  end

  def fiscal_options
    {
      request_body: {
        operation: OPERATION_TYPE,
        transactionId: transaction_id,
        paymentSystemType: PAYMENT_SYSTEM_TYPE,
        totalAmount: amount,
        goods: payable.goods
      }
    }
  end

  def rebill_options
    payment_options.merge(rebill_anchor: payment_card.rebill_anchor)
  end

  def create_payment_card(payment_card_params)
    # Skip if the current payment is a rebill
    return if payment_card.present?
    # Skip if params are empty
    return unless payment_card_params.present?

    user.payment_cards.create(payment_card_params)
  end
end

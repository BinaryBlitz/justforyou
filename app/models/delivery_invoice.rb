# == Schema Information
#
# Table name: delivery_invoices
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  paid       :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DeliveryInvoice < ApplicationRecord
  after_create :add_deliveries

  belongs_to :user

  has_one :payment, as: :payable

  has_many :deliveries, dependent: :destroy

  validate :unpaid_deliveries_are_present

  def paid!
    ActiveRecord::Base.transaction do
      update(paid: true)
    end
  end

  def total_price
    @total_price ||= deliveries.map(&:price).inject(0, &:+)
  end

  private

  def unpaid_deliveries_are_present
    errors.add(:base, 'no unpaid deliveries found') if user.unpaid_deliveries.empty?
  end

  def add_deliveries
    deliveries << user.unpaid_deliveries
  end
end

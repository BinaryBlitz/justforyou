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

  has_many :deliveries, dependent: :destroy

  def paid!
    ActiveRecord::Base.transaction do
      update(paid: true)
    end
  end

  def total_price
    deliveries.map(&:price).inject(0, &:+)
  end

  private

  def add_deliveries
    deliveries << user.unpaid_deliveries
  end
end

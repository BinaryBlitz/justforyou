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
  belongs_to :order
  belongs_to :payment_card, optional: true

  validates :amount, numericality: { greater_than: 0 }
end

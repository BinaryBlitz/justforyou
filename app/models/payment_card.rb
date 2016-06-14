# == Schema Information
#
# Table name: payment_cards
#
#  id         :integer          not null, primary key
#  number     :integer          not null
#  name       :string           not null
#  month      :integer          not null
#  year       :integer          not null
#  cvc        :integer          not null
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PaymentCard < ApplicationRecord
  belongs_to :user
  validates :number, length: { in: 16..19 }
  validates :name, length: { maximum: 90 }
  validates :cvc , length: { maximum: 3 }
  validates :name, :number, :month, :year, :cvc, presence: true
end

# == Schema Information
#
# Table name: payment_cards
#
#  id            :integer          not null, primary key
#  number        :integer          not null
#  holder        :string           not null
#  rebill_anchor :string           not null
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class PaymentCard < ApplicationRecord
  belongs_to :user

  validates :number, length: { in: 16..19 }
  validates :holder, length: { maximum: 90 }
  validates :rebill_anchor, presence: true
end

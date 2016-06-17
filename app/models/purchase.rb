# == Schema Information
#
# Table name: purchases
#
#  id             :integer          not null, primary key
#  number_of_days :integer          not null
#  order_id       :integer
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :order
  has_many :deliveries, dependent: :destroy

  validates :number_of_days, numericality: { greater_than: 0 }
end

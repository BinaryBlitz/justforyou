# == Schema Information
#
# Table name: deliveries
#
#  id            :integer          not null, primary key
#  status        :integer          default("pending")
#  scheduled_for :datetime         not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  address_id    :integer
#  purchase_id   :integer
#  comment       :text
#

class Delivery < ApplicationRecord
  belongs_to :purchase
  belongs_to :address

  validates :status, :scheduled_for, presence: true

  enum status: %i(pending delivered canceled)

  scope :not_canceled, -> { where.not(status: 'canceled') }
end

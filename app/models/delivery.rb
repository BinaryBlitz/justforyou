# == Schema Information
#
# Table name: deliveries
#
#  id            :integer          not null, primary key
#  status        :string           not null
#  scheduled_for :datetime         not null
#  order_id      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Delivery < ApplicationRecord
  belongs_to :order

  validates :status, :scheduled_for, presence: true

  enum status: %i(pending canceled delivered)
end

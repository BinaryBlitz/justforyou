# == Schema Information
#
# Table name: deliveries
#
#  id           :integer          not null, primary key
#  status       :string           not null
#  delivered_at :datetime         not null
#  order_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Delivery < ApplicationRecord
  belongs_to :order

  validates :status, :delivered_at, presence: true

  def delivery_rejection
    return unless ((delivered_at - DateTime.now) / 1.hour).round > 36
    status = 'Rejected'
    update_column(:status, status)
  end
end

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
  after_save :update_counter_cache
  after_destroy :update_counter_cache

  belongs_to :purchase
  belongs_to :address

  validates :status, :scheduled_for, presence: true

  enum status: %i(pending delivered canceled)

  scope :valid, -> { where.not(status: :canceled) }

  private

  def update_counter_cache
    purchase.update(deliveries_count: purchase.deliveries.valid.count)
  end
end

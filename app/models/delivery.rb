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
#  paid          :boolean          default(FALSE)
#

class Delivery < ApplicationRecord
  after_save :update_counter_cache
  after_destroy :update_counter_cache

  belongs_to :purchase
  belongs_to :address

  validates :status, :scheduled_for, presence: true
  validate :past_deliveries_paid?

  enum status: %i(pending delivered canceled)

  scope :valid, -> { where.not(status: :canceled) }
  scope :unpaid, -> { where(paid: false) }

  private

  def update_counter_cache
    purchase.update(deliveries_count: purchase.deliveries.valid.count)
  end

  def past_deliveries_paid?
    errors.add(:base, 'unpaid deliveries are present') if user.unpaid_deliveries.any?
  end
end

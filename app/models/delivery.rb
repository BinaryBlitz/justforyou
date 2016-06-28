# == Schema Information
#
# Table name: deliveries
#
#  id                  :integer          not null, primary key
#  status              :integer          default("pending")
#  scheduled_for       :datetime         not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  address_id          :integer
#  purchase_id         :integer
#  comment             :text
#  paid                :boolean          default(FALSE)
#  delivery_invoice_id :integer
#

class Delivery < ApplicationRecord
  FREE_DELIVERY_DISTANCE = 30
  PRICE_PER_KM = 10
  ORIGIN = [55.755833, 37.617778]

  after_create :set_paid
  after_save :update_counter_cache
  after_destroy :update_counter_cache

  belongs_to :purchase
  belongs_to :address
  belongs_to :delivery_invoice, optional: true

  validates :status, :scheduled_for, presence: true
  validate :past_deliveries_are_paid, on: :create

  enum status: %i(pending delivered canceled)

  scope :valid, -> { where.not(status: :canceled) }
  scope :unpaid, -> { where(paid: false) }

  delegate :user, to: :purchase

  def price
    center_location = Geokit::LatLng.new(*ORIGIN)
    address_location = Geokit::LatLng.new(*address.to_location)
    distance = center_location.distance_to(address_location)

    return 0 if distance <= FREE_DELIVERY_DISTANCE

    ((distance - FREE_DELIVERY_DISTANCE) * PRICE_PER_KM).round
  end

  private

  def set_paid
    update(paid: true) if price == 0
  end

  def update_counter_cache
    purchase.update(deliveries_count: purchase.deliveries.valid.count)
  end

  def past_deliveries_are_paid
    errors.add(:base, 'unpaid deliveries are present') if user.unpaid_deliveries.any?
  end
end

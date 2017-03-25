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
  # Moscow Kilometre Zero
  ORIGIN = [55.755833, 37.617778]
  CANCELABLE_HOURS = 36
  CANCELABLE_BEFORE = '11:00'

  after_create :set_paid
  after_save :update_counter_cache
  after_destroy :update_counter_cache

  belongs_to :purchase
  belongs_to :address
  belongs_to :delivery_invoice, optional: true

  validates :status, :scheduled_for, presence: true
  validate :past_deliveries_are_paid, on: :create
  validate :purchase_not_completed, on: :create
  validate :not_too_late, on: :create

  enum status: %i(pending delivered canceled)

  scope :valid, -> { where.not(status: :canceled) }
  scope :unpaid, -> { where(paid: false) }
  scope :on_date, -> (date) { where(scheduled_for: date.beginning_of_day..date.end_of_day) }
  scope :latest, -> { where('scheduled_for > ?', Time.zone.now) }

  delegate :user, :program, to: :purchase

  # Based on distance from city center, return 0 if below threshold
  def price
    center_location = Geokit::LatLng.new(*ORIGIN)
    address_location = Geokit::LatLng.new(*address.to_location)
    distance = center_location.distance_to(address_location)

    return 0 if distance <= Configurable.free_delivery_distance

    ((distance - Configurable.free_delivery_distance) * Configurable.price_per_km).round
  end

  # The number of the day in program
  def position
    purchase.deliveries
      .valid
      .order(scheduled_for: :asc)
      .find_index(self)
  end

  def cancelable?
    # Deliveries scheduled for today or earlier cannot be canceled
    return false if scheduled_for < Time.zone.now.end_of_day
    # Deliveries scheduled for two days from now can be canceled
    return true if scheduled_for > 2.days.from_now.beginning_of_day
    # Deliveries for tomorrow can be canceled before 11:00 of the current day
    return true if Time.zone.now < Time.zone.parse(CANCELABLE_BEFORE)

    false
  end

  def ends_at
    (scheduled_for + 1.hour).strftime('%H:%M')
  end

  private

  def set_paid
    update(paid: true) if price.zero?
  end

  def update_counter_cache
    purchase.update_column(:deliveries_count, purchase.deliveries.valid.count)
  end

  def not_too_late
    return unless scheduled_for.present?

    errors.add(:base, 'delivery is not cancelable') unless cancelable?
  end

  def past_deliveries_are_paid
    errors.add(:base, 'unpaid deliveries are present') if user.unpaid_deliveries.any?
  end

  def purchase_not_completed
    errors.add(:purchase, "doesn't have any days left") if purchase.completed?
  end
end

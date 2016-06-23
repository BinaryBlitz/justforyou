# == Schema Information
#
# Table name: purchases
#
#  id             :integer          not null, primary key
#  number_of_days :integer          not null
#  program_id     :integer
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :program

  has_many :deliveries, dependent: :destroy

  validates :number_of_days, numericality: { greater_than: 0 }
  validates :program, uniqueness: { scope: :user }

  def number_of_deliveries
    deliveries.size
  end

  def number_of_remaining_days
    number_of_days - deliveries.not_canceled.size
  end

  def self.with_remaining_deliveries
    joins(:deliveries)
      .merge(Delivery.not_canceled)
      .group('purchases.id')
      .having('count(deliveries.id) < number_of_days')
  end
end

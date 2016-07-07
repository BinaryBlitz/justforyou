# == Schema Information
#
# Table name: purchases
#
#  id               :integer          not null, primary key
#  number_of_days   :integer          not null
#  program_id       :integer
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  deliveries_count :integer          default(0)
#

class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :program

  has_many :deliveries, dependent: :destroy
  has_many :exchanges, dependent: :destroy

  validates :number_of_days, numericality: { greater_than: 0 }
  validates :program, uniqueness: { scope: :user }

  scope :visible, -> { where('deliveries_count < number_of_days') }

  def days_left
    number_of_days - deliveries_count
  end

  def completed?
    deliveries_count >= number_of_days
  end

  # Add days to current purchase of set value if new record
  def add_days(value)
    if new_record?
      update(number_of_days: value)
    else
      update(number_of_days: number_of_days + value)
    end
  end
end

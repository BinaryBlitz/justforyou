# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  entrance   :integer
#  floor      :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  latitude   :float            not null
#  longitude  :float            not null
#  deleted_at :datetime
#  apartment  :integer
#  house      :string
#

class Address < ApplicationRecord
  ATTRIBUTES = { house: 'дом', entrance: 'подъезд', apartment: 'квартира', floor: 'этаж' }

  default_scope { where(deleted_at: nil) }

  has_many :deliveries, dependent: :destroy
  belongs_to :user

  validates :content, :house, presence: true
  validates :apartment, numericality: { greater_than: 0 }
  validates :entrance, :floor, numericality: { greater_than: 0 }, allow_nil: true
  validates :latitude, inclusion: { in: -90..90 }
  validates :longitude, inclusion: { in: -180..180 }

  def to_location
    [latitude, longitude]
  end

  def to_s
    "#{content}, " +
      ATTRIBUTES.select { |attribute, _| self[attribute].present? }
                .map { |attribute, prefix| "#{prefix} #{self[attribute]}" }
                .join(', ')
  end
end

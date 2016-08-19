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
#  house      :integer
#

class Address < ApplicationRecord
  default_scope { where(deleted_at: nil) }

  has_many :deliveries, dependent: :destroy
  belongs_to :user

  validates :content, presence: true
  validates :latitude, inclusion: { in: -90..90 }
  validates :longitude, inclusion: { in: -180..180 }

  def to_location
    [latitude, longitude]
  end
end

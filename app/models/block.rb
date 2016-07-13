# == Schema Information
#
# Table name: blocks
#
#  id             :integer          not null, primary key
#  name           :string           not null
#  image          :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  programs_count :integer          default(0)
#  color          :string
#

class Block < ApplicationRecord
  HEX_COLOR_FORMAT = /\A#(?:[0-9a-f]{3})(?:[0-9a-f]{3})?\z/i

  has_many :programs, dependent: :destroy

  validates :name, :image, presence: true
  validates :color, uniqueness: { case_sensitive: false }, format: { with: HEX_COLOR_FORMAT }

  before_save { color.downcase! }

  mount_uploader :image, ImageUploader
end

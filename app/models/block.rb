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
#

class Block < ApplicationRecord
  has_many :programs, dependent: :destroy

  validates :name, :image, presence: true

  mount_uploader :image, ImageUploader
end

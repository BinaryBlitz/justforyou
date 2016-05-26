# == Schema Information
#
# Table name: blocks
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  image      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Block < ApplicationRecord
  has_many :programs, dependent: :destroy

  validates :title, :image, presence: true
end

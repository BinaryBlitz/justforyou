# == Schema Information
#
# Table name: programs
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  description     :text             not null
#  threshold       :integer          not null
#  primary_price   :integer          not null
#  secondary_price :integer          not null
#  preview_image   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  block_id        :integer
#  prescription    :text             default([]), is an Array
#

class Program < ApplicationRecord
  belongs_to :block

  has_many :days, dependent: :destroy, inverse_of: :program
  has_many :line_items, dependent: :destroy

  validates :name, presence: true, length: { maximum: 20 }
  validates :preview_image, :description, :prescription, :block, presence: true
  validates :threshold, numericality: { greater_than: 0 }
  validates :primary_price, :secondary_price, numericality: { greater_than: 0 }

  mount_uploader :preview_image, PreviewImageUploader
end

# == Schema Information
#
# Table name: programs
#
#  id               :integer          not null, primary key
#  name             :string           not null
#  description      :text             not null
#  threshold        :integer          not null
#  primary_price    :integer          not null
#  secondary_price  :integer          not null
#  image            :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  block_id         :integer
#  prescription     :text             default([]), is an Array
#  preview          :string
#  individual_price :boolean          default(FALSE)
#  unit             :string           not null
#

class Program < ApplicationRecord
  belongs_to :block, counter_cache: true

  has_many :days, dependent: :destroy, inverse_of: :program
  has_many :items, through: :days
  has_many :line_items, dependent: :destroy
  has_many :purchases, dependent: :destroy

  validates :name, presence: true, length: { maximum: 20 }
  validates :image, :description, :prescription, :preview, :block, presence: true
  validates :threshold, numericality: { greater_than: 0 }
  validates :primary_price, :secondary_price, numericality: { greater_than: 0 }
  validates :unit, inclusion: { in: %w(day piece) }

  mount_uploader :image, ImageUploader

  def price(number_of_days)
    price = number_of_days < threshold ? primary_price : secondary_price
    price * number_of_days
  end
end

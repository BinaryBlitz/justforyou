# == Schema Information
#
# Table name: programs
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  description     :text             not null
#  duration        :integer          not null
#  primary_price   :integer          not null
#  secondary_price :integer          not null
#  preview_image   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Program < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, presence: true, length: { maximum: 20 }
  validates :preview_image, :description, presence: true
  validates :duration, numericality: { greater_than: 0 }
  validates :primary_price,
            :secondary_price, numericality: { greater_than_or_equal_to: 0 }
end

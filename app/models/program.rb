class Program < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, presence: true, length: { maximum: 20 }
  validates :preview_image, :description, presence: true
  validates :duration, numericality: { greater_than: 0 }
  validates :primary_price,
            :secondary_price, numericality: { greater_than_or_equal_to: 0 }
end

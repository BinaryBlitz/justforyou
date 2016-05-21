class Program < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :preview_img, :description, presence: true
  validates :duration, numericality: { greater_than: 0 }
  validates :first_price, :second_price, numericality: { greater_than_or_equal_to: 0 }
end

class Order < ApplicationRecord
  belongs_to :user

  validates :phone_number, presence: true
  validates :comment, length: { maximum: 1000 }
end

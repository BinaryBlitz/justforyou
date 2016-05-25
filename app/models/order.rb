class Order < ApplicationRecord
  belongs_to :user

  validates :comment, length: { maximum: 1000 }
  include Phonable
end

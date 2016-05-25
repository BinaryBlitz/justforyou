class Product < ApplicationRecord
  belongs_to :program

  validates :name, presence: true
end

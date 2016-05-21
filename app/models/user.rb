class User < ApplicationRecord
  validates :first_name, :last_name, presence: true, length: { maximum: 20 }
end

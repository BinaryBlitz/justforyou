class User < ApplicationRecord
  validates :first_name, :last_name, presence: true, length: { maximum: 20 }
  validates :phone_number, format: { with: /\A[+]\d[0-9]{0,14}\z/}
end

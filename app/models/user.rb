class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy

  validates :first_name, :last_name, presence: true, length: { maximum: 20 }
  include Phonable

  has_secure_token :api_token

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.search(query)
    return all unless query.present?
    where("concat(first_name, ' ', last_name) ILIKE ?", "%#{query}%")
  end
end

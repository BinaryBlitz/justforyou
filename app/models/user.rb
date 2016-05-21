class User < ApplicationRecord
  validates :first_name, :last_name, presence: true, length: { maximum: 20 }
  include Phonable

  def full_name
    "#{first_name} #{last_name}"
  end
end

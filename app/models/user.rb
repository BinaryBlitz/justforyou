class User < ApplicationRecord
  validates :first_name, :last_name, presence: true, length: { maximum: 20 }
  include Phonable

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.search(search)
    if search
      where("first_name ILIKE :search OR
             last_name ILIKE :search OR
             concat(first_name,' ',last_name) ILIKE :search",
             search: "%#{search}%")
    else
      all
    end
  end
end

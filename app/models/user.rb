# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  first_name   :string           not null
#  last_name    :string           not null
#  phone_number :string           not null
#  email        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  api_token    :string
#

class User < ApplicationRecord
  include Phonable

  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :substitutions, dependent: :destroy

  validates :first_name, :last_name, presence: true, length: { maximum: 20 }
  validates :email, email: true, uniqueness: { case_sensitive: false }
  validates :phone_number, uniqueness: true

  has_secure_token :api_token

  def self.search(query)
    return all unless query.present?
    where("concat(first_name, ' ', last_name) ILIKE ?", "%#{query}%")
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end

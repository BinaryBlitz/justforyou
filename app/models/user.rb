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
#  balance      :integer          default(0)
#

class User < ApplicationRecord
  include Phonable

  SMALL_BONUS = 0.05
  BIG_BONUS = 0.1
  SPECIAL_BONUS = 15_000
  BONUS_DAY = 101

  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :substitutions, dependent: :destroy

  validates :first_name, :last_name, presence: true, length: { maximum: 20 }
  validates :email, email: true, uniqueness: { case_sensitive: false }
  validates :phone_number, uniqueness: true
  validates :balance, numericality: { greater_than_or_equal_to: 0 }

  has_secure_token :api_token

  def self.search(query)
    return all unless query.present?
    where("concat(first_name, ' ', last_name) ILIKE ?", "%#{query}%")
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def number_of_days_sum
    orders.inject(0) { |sum, item| sum + item.line_items.sum(:number_of_days) }
  end

  def bonus_percentage
    if number_of_days_sum >= 31 && number_of_days_sum <= 100
      SMALL_BONUS
    elsif number_of_days_sum >= BONUS_DAY
      BIG_BONUS
    end
  end
end

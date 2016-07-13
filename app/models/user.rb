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
#  device_token :string
#

class User < ApplicationRecord
  include Phonable

  has_many :orders, dependent: :destroy
  has_many :line_items, through: :orders
  has_many :payments, through: :orders
  has_many :exchanges, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :substitutions, dependent: :destroy
  has_many :payment_cards, dependent: :destroy
  has_many :purchases, dependent: :destroy
  has_many :programs, through: :purchases
  has_many :deliveries, through: :purchases
  has_many :delivery_invoices, dependent: :destroy

  validates :first_name, :last_name, presence: true, length: { maximum: 20 }
  validates :email, email: true, uniqueness: { case_sensitive: false }
  validates :phone_number, uniqueness: true
  validates :balance, numericality: { greater_than_or_equal_to: 0, less_than: 1_000_000 }

  has_secure_token :api_token

  def self.search(query)
    return all unless query.present?
    where("concat(first_name, ' ', last_name) ILIKE ?", "%#{query}%")
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def total_number_of_days
    orders.inject(0) { |sum, item| sum + item.line_items.sum(:number_of_days) }
  end

  def discount
    if total_number_of_days >= Configurable.big_discount_threshold
      return Configurable.big_discount * 0.01
    elsif total_number_of_days >= Configurable.small_discount_threshold
      return Configurable.small_discount * 0.01
    end
    0.0
  end

  def add_balance(value)
    update_column(:balance, balance + value)
  end

  def redeem_balance(value)
    if value >= balance
      update_column(:balance, 0)
    else
      update_column(:balance, balance - value)
    end
  end

  def unpaid_deliveries
    deliveries.unpaid.valid
  end
end

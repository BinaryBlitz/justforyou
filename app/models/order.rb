# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  phone_number    :string           not null
#  comment         :text
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  paid            :boolean          default(FALSE)
#  pending_balance :integer          default(0)
#

class Order < ApplicationRecord
  include Phonable

  belongs_to :user

  has_many :line_items, dependent: :destroy, inverse_of: :order

  validates :comment, length: { maximum: 1000 }
  validates :line_items, presence: true
  validates :pending_balance, numericality: { greater_or_equal_than: 0 }

  after_save :set_pending_balance
  after_save :set_user_balance

  accepts_nested_attributes_for :line_items, allow_destroy: true

  def total_price
    @total_price ||= begin
      threshold = line_items.joins(:program).maximum(:threshold)
      line_items.inject(0) { |sum, item| sum + item.price_for_threshold(threshold) }
    end
  end

  def set_pending_balance
    pending_balance = total_price * user.bonus_percentage
    update_column(:pending_balance, pending_balance)
  end

  def set_user_balance
    user.update_column(:balance, pending_balance) if paid
  end
end

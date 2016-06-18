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

  has_one :payment
  has_many :line_items, dependent: :destroy, inverse_of: :order
  has_many :programs, through: :line_items

  validates :comment, length: { maximum: 1000 }
  validates :line_items, presence: true
  validates :pending_balance, numericality: { greater_than_or_equal_to: 0 }

  after_create :set_pending_balance

  accepts_nested_attributes_for :line_items, allow_destroy: true

  def paid!
    ActiveRecord::Base.transaction do
      update(paid: true)
      user.add_balance(pending_balance)
      user.update_column(:balance, user.balance - total_price) if user.balance >= total_price && payment.balance?

      line_items.each do |item|
        user.purchases.create(program: item.program, number_of_days: item.number_of_days)
      end
    end
  end

  def balance_price
    1 if user.balance >= total_price && payment.balance?
  end

  def total_price
    @total_price ||= begin
      threshold = programs.maximum(:threshold)
      line_items.inject(0) { |sum, item| sum + item.price_for_threshold(threshold) }
    end
  end

  def set_pending_balance
    self.pending_balance = total_price * user.discount
  end
end

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
#  use_balance     :boolean          default(FALSE)
#

class Order < ApplicationRecord
  include Phonable

  belongs_to :user

  has_one :payment, as: :payable
  has_many :line_items, dependent: :destroy, inverse_of: :order
  has_many :programs, through: :line_items

  validates :comment, length: { maximum: 1000 }
  validates :line_items, presence: true
  validates :pending_balance, numericality: { greater_than_or_equal_to: 0 }

  after_create :set_pending_balance, unless: :use_balance?

  accepts_nested_attributes_for :line_items, allow_destroy: true

  scope :paid, -> { where(paid: true) }

  def self.search(from, to)
    return all unless from.present? && to.present?
    where(created_at: from..to.end_of_day)
  end

  # Perform after paid callbacks
  def paid!
    return if paid?

    ActiveRecord::Base.transaction do
      update(paid: true)
      calculate_user_balance
      configure_purchases
    end
  end

  # Price to be paid including user balance
  def total_price
    @total_price ||= begin
      total_price = line_items_price
      total_price -= user.balance if use_balance?
      total_price.positive? ? total_price : 1
    end
  end

  private

  # Pending balance is applied after a successful payment
  def set_pending_balance
    update_column(:pending_balance, total_price * user.discount)
  end

  # Price before applying user balance
  def line_items_price
    @line_items_price ||= begin
      threshold = programs.maximum(:threshold)
      line_items.inject(0) { |sum, item| sum + item.price_for_threshold(threshold) }
    end
  end

  # Calculate new balance after a successful payment
  def calculate_user_balance
    if use_balance?
      user.redeem_balance(line_items_price)
    else
      user.add_balance(pending_balance)
    end
  end

  # Create purchase for each program or add days if already present
  def configure_purchases
    line_items.each do |item|
      purchase = user.purchases.find_or_initialize_by(program: item.program)

      if purchase.new_record?
        purchase.number_of_days = item.number_of_days
      else
        purchase.number_of_days += item.number_of_days
      end

      purchase.save
    end
  end
end

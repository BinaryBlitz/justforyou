# == Schema Information
#
# Table name: exchanges
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  purchase_id     :integer
#  program_id      :integer
#  paid            :boolean          default(FALSE)
#  pending_balance :integer          default(0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Exchange < ApplicationRecord
  belongs_to :user
  belongs_to :purchase
  belongs_to :program

  has_one :payment, as: :payable

  validates :purchase, uniqueness: { scope: :user }
  validate :different_program
  validate :not_completed

  def paid!
    ActiveRecord::Base.transaction do
      update(paid: true)
      calculate_user_balance
      configure_purchases
    end
  end

  def total_price
    # Price of the new program
    price = purchase.days_left * program.primary_price
    # Add balance if the new price is cheaper
    if price <= original_price
      self.pending_balance = original_price - price
      1
    else
      price - original_price
    end
  end

  private

  # Total price of the original program
  def original_price
    program.price(purchase.number_of_days)
  end

  def not_completed
    return unless purchase
    errors.add(:purchase, "doesn't have any days left") if purchase.completed?
  end

  def different_program
    return unless purchase && program
    errors.add(:program, 'is identical') if purchase.program == program
  end

  def calculate_user_balance
    user.add_balance(pending_balance) if pending_balance > 0
  end

  def configure_purchases
    new_purchase = user.purchases.find_or_initialize_by(program: program)

    if new_purchase.new_record?
      new_purchase.number_of_days = purchase.days_left
    else
      new_purchase.number_of_days += purchase.days_left
    end

    new_purchase.save

    purchase.update(number_of_days: purchase.deliveries_count)
  end
end
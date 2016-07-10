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

  validate :different_program
  validate :not_completed

  after_create :set_pending_balance, if: :free?
  after_create :paid!, if: :free?

  def paid!
    ActiveRecord::Base.transaction do
      update(paid: true)
      calculate_user_balance
      configure_purchases
    end
  end

  def total_price
    return if free?
    new_program_price - original_price
  end

  private

  def set_pending_balance
    update_column(:pending_balance, original_price - new_program_price)
  end

  def free?
    new_program_price <= original_price
  end

  # Total price of the original program
  def original_price
    purchase.program.price(purchase.days_left)
  end

  # Price of the new program
  def new_program_price
    program.price(purchase.days_left)
  end

  # Exchange is invalid if no more days are left in a purchase
  def not_completed
    return unless purchase
    errors.add(:purchase, "doesn't have any days left") if purchase.completed?
  end

  # Exchange for the same program is invalid
  def different_program
    return unless purchase && program
    errors.add(:program, 'is identical') if purchase.program == program
  end

  # Add pending balance if any
  def calculate_user_balance
    user.add_balance(pending_balance) if pending_balance > 0
  end

  # Create purchase or find an existing one and add days
  def configure_purchases
    new_purchase = user.purchases.find_or_initialize_by(program: program)
    new_purchase.add_days(purchase.days_left)

    # Subtract all remaining days from the original purchase, skip validations
    purchase.update_attribute(:number_of_days, purchase.deliveries_count)
  end
end

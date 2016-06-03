# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  phone_number :string           not null
#  comment      :text
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Order < ApplicationRecord
  include Phonable

  SPECIAL_BONUS = 15_000
  BONUS_DAY = 101
  SMALL_BONUS = 0.05
  BIG_BONUS = 0.1

  before_save :set_bonuses
  before_save :set_special_bonuses

  belongs_to :user

  has_many :line_items, dependent: :destroy, inverse_of: :order

  validates :comment, length: { maximum: 1000 }
  validates :line_items, presence: true

  accepts_nested_attributes_for :line_items, allow_destroy: true

  private

  def total_price
    @total_price ||=
      if line_items.size > 1
        multi_program_price
      else
        single_program_price
      end
  end

  def single_program_price
    number_of_days = line_items.first.number_of_days
    program = line_items.first.program
    price =
      if program.limit > number_of_days
        program.primary_price
      else
        program.secondary_price
      end
    number_of_days * price
  end

  def limit_sum
    @limit_sum = line_items.inject(0) { |sum, e| sum + e.program.limit }
  end

  def max_number_of_days
    @max_number_of_days = line_items.maximum(:number_of_days)
  end

  def multi_program_price
    line_items.sum do |item|
      price =
        if limit_sum >= max_number_of_days
          item.program.secondary_price
        else
          item.program.primary_price
        end
      item.number_of_days * price
    end
  end

  def number_of_days_sum
    @number_of_days_sum = line_items.sum(&:number_of_days)
  end

  def set_bonuses
    if number_of_days_sum >= 31 && number_of_days_sum <= 100
      user.bonuses += total_price * SMALL_BONUS
    elsif number_of_days_sum >= BONUS_DAY
      user.bonuses += total_price * BIG_BONUS
    end
    true
  end

  def set_special_bonuses
    special_day = (number_of_days_sum - BONUS_DAY) / 100 + 1
    user.bonuses += special_day * SPECIAL_BONUS if number_of_days_sum >= BONUS_DAY
    true
  end
end

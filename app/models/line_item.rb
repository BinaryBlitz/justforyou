# == Schema Information
#
# Table name: line_items
#
#  id             :integer          not null, primary key
#  order_id       :integer
#  program_id     :integer
#  number_of_days :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class LineItem < ApplicationRecord
  belongs_to :order, inverse_of: :line_items
  belongs_to :program

  validates :number_of_days, numericality: { greater_than: 0 }
  validates :program, uniqueness: { scope: :order }

  def price
    price_for_threshold(program.threshold)
  end

  def price_for_threshold(threshold)
    price = number_of_days < threshold ? program.primary_price : program.secondary_price
    price * number_of_days
  end
end

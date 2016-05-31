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
  belongs_to :order
  belongs_to :program

  validates :number_of_days, numericality: { greater_than: 0 }
end

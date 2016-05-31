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

  belongs_to :user

  has_many :line_items, dependent: :destroy, inverse_of: :order

  validates :comment, length: { maximum: 1000 }
  validates :line_items, presence: true

  accepts_nested_attributes_for :line_items, allow_destroy: true
end
